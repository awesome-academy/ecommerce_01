class CheckoutsController < ApplicationController
  before_action :current_user, :check_logged_in, only: %i(new create)
  before_action :current_cart, :load_order_info, only: %i(create confirm)
  include CartsHelper

  def new; end

  def create
    # save order and order_item
    ActiveRecord::Base.transaction do
      @failed = 0
      order_process
      order_items_process
      if @failed.positive?
        flash.now[:danger] = t "controller.checkouts.checkout_failed"
        render_500
        raise ActiveRecord::Rollback
      else
        @order.update_attribute :status, "accepted"
        restart_cart
        remove_order_info
        flash[:success] = t "controller.checkouts.checkout_successfully"
        redirect_to root_path
      end
    end
    # send mail
  end

  def confirm
    return load_cart_info if request.get?
    return unless request.post?
    store_order_info
    load_cart_info
    redirect_to confirm_checkouts_path
  end

  private

  def load_cart_info
    @cart_items = session[:cart].values
    @products_in_cart = (session[:cart].keys.map do |id|
      Product.basic_product_info.find_by id: id
    end).reject(&:blank?)
  end

  def load_order_info
    return @order_info = {} unless cookies[:order_info].present?
    @order_info = JSON.parse(cookies[:order_info])
  end

  def order_items_process
    @order_items = session[:cart]
    @order_items.each do |key, item|
      product = Product.basic_product_info.find_by id: key
      @order_item = @order.order_items.new
      @order_item.product_id = product.id
      @order_item.quantity = item["quantity"].to_i
      @order_item.price = product.price
      @order_item.size = product.size
      @order_item.color = product.color
      begin
        @order_item.save!
      rescue StandardError
        @failed += 1
      end
    end
  end

  def order_process
    @order = @current_user.orders.new
    @order.order_name = @order_info["order_name"]
    @order.order_phone = @order_info["order_phone"]
    @order.order_address = @order_info["order_address"]
    begin
      @order.save!
    rescue StandardError
      @failed += 1
    end
  end

  def order_params
    params.require(:order).permit :order_name, :order_phone, :order_address
  end

  def remove_order_info
    cookies.delete :order_info, domain: Settings.domain
  end

  def check_logged_in
    return if logged_in?
    store_location
    flash[:info] = t "controller.checkouts.require_login"
    redirect_to login_path
  end

  def restart_cart
    session[:cart] = {}
    cookies.delete :cart, domain: Settings.domain
  end

  def store_order_info
    order_info = {}
    order_info[:order_name] = params[:order_info][:order_name]
    order_info[:order_phone] = params[:order_info][:order_phone]
    order_info[:order_address] = params[:order_info][:order_address]
    cookies[:order_info] = {
      value: JSON.generate(order_info),
      expires: Settings.checkouts.cookies_expiry.hours.from_now
    }
  end
end

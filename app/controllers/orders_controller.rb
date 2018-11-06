class OrdersController < ApplicationController
  before_action :current_user, :check_logged_in, only: %i(new create checkout)
  before_action :current_cart, :load_order_info, only: %i(create checkout)
  include CartsHelper

  def new; end

  def create
    # save order and order_item
    ActiveRecord::Base.transaction do
      if order_process
        @order.accepted!
        restart_cart
        remove_order_info
        flash[:success] = t "controller.checkouts.checkout_successfully"
        redirect_to root_path
      end
    rescue StandartError
      flash[:danger] = t "controller.checkouts.checkout_failed"
      redirect_to cart_path
    end
    # send mail
  end

  def checkout
    return load_cart_info if request.get?
    return unless request.post?
    @order = @current_user.orders.new
    @order.order_items.new
    store_order_info
    load_cart_info
    redirect_to checkout_orders_path
  end

  private

  def check_logged_in
    return if logged_in?
    store_location
    flash[:info] = t "controller.checkouts.require_login"
    redirect_to login_path
  end

  def load_cart_info
    @order = @current_user.orders.new
    @order.order_items.new
    @cart_items = session[:cart].values
    @products_in_cart = (session[:cart].keys.map do |id|
      Product.basic_product_info.find_by id: id
    end).reject(&:blank?)
  end

  def load_order_info
    return @order_info = {} unless cookies[:order_info].present?
    @order_info = JSON.parse(cookies[:order_info])
  end

  def order_process
    @order = @current_user.orders.new order_params
    @order.save!
  end

  def remove_order_info
    cookies.delete :order_info, domain: Settings.domain
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

  def order_params
    params.require(:order).permit(:user_id, :order_name, :order_phone,
      :order_address, order_items_attributes: [:id, :order_id, :product_id,
      :quantity, :price, :color])
  end
end

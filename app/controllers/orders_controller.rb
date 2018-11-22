class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user, :check_logged_in, :current_cart,
    :load_order_info, :load_cart_info, only: %i(new create)
  before_action :validate_cart_present, :validate_cart_size,
    :validate_details_in_cart, :validate_product_quantity_in_stock,
    only: :create
  after_action :store_order_info, only: :create
  load_and_authorize_resource only: %i(show destroy)
  include CartsHelper

  def index
    @orders = current_user.orders
                          .orders_allowed_to_view.paginate page: params[:page],
      per_page: Settings.order.per_page
  end

  def new
    init_order_and_order_item
  end

  def create
    # save order and order_item
    ActiveRecord::Base.transaction do
      @order = @current_user.orders.new order_params
      if @order.save!
        @order.accepted!
        decrease_product_quantity_in_stock
        restart_cart
        flash[:success] = t "controller.orders.checkout_successfully"
        redirect_to root_path
      end
    rescue StandardError
      flash.now[:danger] = t "controller.orders.checkout_failed"
      render :new
    end
    # send mail
  end

  def show
    @order = current_user.orders.find_by id: params[:id]
    if @order
      @order_items = @order.order_items.paginate page: params[:page],
        per_page: Settings.order.per_page
    else
      flash[:danger] = t "controller.orders.order_not_found"
      redirect_to orders_path
    end
  end

  def update
    @order = Order.find_by id: params[:id]
    return redirect_to orders_path if @order.approved? || @order.cancelled!
    flash[:danger] = t "controller.orders.destroy_failed"
    redirect_to orders_path
  end

  private

  def load_cart_info
    @cart_items = session[:cart].values
    ids = session[:cart].keys.reject(&:blank?).map{|i| "'" + i.to_s + "'"}
                        .join(",")
    @products_in_cart = Product.list_products_by_ids(ids)
  end

  def load_order_info
    return @order_info = {} unless cookies[:order_info].present?
    @order_info = JSON.parse(cookies[:order_info])
  end

  def init_order_and_order_item
    @order = @current_user.orders.new
    @order.order_items.new
  end

  def restart_cart
    session.delete :cart
    cookies.delete :cart, domain: Settings.domain
    remove_order_info
  end

  def store_order_info
    order_info = {}
    order_info[:order_name] = params[:order][:order_name]
    order_info[:order_phone] = params[:order][:order_phone]
    order_info[:order_address] = params[:order][:order_address]
    cookies[:order_info] = {
      value: JSON.generate(order_info),
      expires: Settings.checkouts.cookies_expiry.hours.from_now
    }
  end

  def decrease_product_quantity_in_stock
    product = Product.new
    product.decrease_unit_in_stock session[:cart].values
  end

  def order_params
    params.require(:order).permit(:user_id, :order_name, :order_phone,
      :order_address, order_items_attributes: [:id, :order_id, :product_id,
      :quantity, :price, :color])
  end

  def conditional_checking product, item
    product.unit_in_stock.positive? &&
      product.unit_in_stock >= item["quantity"].to_i
  end

  def add_flash_danger product
    t("controller.orders.remains_quantity", name: product.name,
        unit: product.unit,
        count: product.unit_in_stock)
  end

  # Validate
  # product in stock
  def validate_product_quantity_in_stock
    init_order_and_order_item
    session[:cart].values.each do |item|
      product = Product.find_by id: item["product_id"].to_i
      next if conditional_checking(product, item)
      @order.errors.add(:unit_in_stock, add_flash_danger(product))
    end
    return if @order.errors.blank?
    render :new
  end

  # cart
  def validate_cart_present
    return if session[:cart].present?
    flash[:danger] = t "controller.orders.no_products_in_cart"
    redirect_to cart_path
  end

  def validate_cart_size
    items_in_params = params[:order][:order_items_attributes].values
    return if items_in_params.size == session[:cart].values.size
    flash[:danger] = t "controller.orders.validate_checkout_failed"
    redirect_to cart_path
  end

  def validate_details_in_cart
    items_in_params = params[:order][:order_items_attributes].values
    check = sub_check_details_in_cart items_in_params
    return if check == items_in_params.size
    flash[:danger] = t "controller.orders.validate_checkout_failed"
    redirect_to cart_path
  end

  def sub_check_details_in_cart items_in_params
    sub_check = 0
    session[:cart].values.each_with_index do |cart_item, index_cart|
      items_in_params.each_with_index do |params_item, index_params|
        if index_cart == index_params &&
           cart_item["product_id"] == params_item["product_id"] &&
           cart_item["quantity"] == params_item["quantity"]
          sub_check += 1
          break
        end
        next
      end
    end
    sub_check
  end
end

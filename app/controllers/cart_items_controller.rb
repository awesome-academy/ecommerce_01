class CartItemsController < ApplicationController
  before_action :current_cart
  after_action :store_cart_cookies, only: %i(create update destroy)
  after_action :add_recent_products, only: :create

  def create
    add_to_session_cart
    respond_to do |format|
      format.html{redirect_to product_path(params[:order_item][:product_id])}
      format.js do
        render js: "alert(I18n.t('controller.carts.add_successfully'))",
          layout: false
      end
    end
  end

  def update
    session[:cart][params[:product_id]]["quantity"] = params[:quantity]
  rescue StandardError
    respond_to do |format|
      format.json do
        render json: {status: 400,
                      errors: I18n.t("js.cart.nolonger_exist")}.to_json
      end
    end
  else
    respond_to do |format|
      format.html{redirect_to cart_path}
    end
  end

  def destroy
    session[:cart].delete(params[:product_id])
    respond_to do |format|
      format.html{redirect_to cart_path}
    end
  end

  private

  def add_recent_products
    return unless request.post?
    store_recent_products params[:order_item][:product_id]
  end

  def add_to_session_cart
    product_id = params[:order_item][:product_id]
    session[:cart][product_id] = {quantity: params[:order_item][:quantity],
                                  product_id: product_id}
  end

  def store_cart_cookies
    cookies[:cart] = {value: JSON.generate(session[:cart]),
                      expires: Settings.carts.cookies_expiry.hours.from_now}
  end
end

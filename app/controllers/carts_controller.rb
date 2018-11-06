class CartsController < ApplicationController
  before_action :current_cart
  after_action :store_cart_cookies, except: :show

  def show
    @order_items = session[:cart].values
    load_products_info
  end

  def update
    return add_order_item if request.post?
    return update_order_item_quantity if request.put?
  end

  private

  def add_order_item
    add_to_session_cart
    respond_to do |format|
      format.html{redirect_to product_path(params[:order_item][:product_id])}
      format.js do
        render js: "alert(I18n.t('controller.carts.add_successfully'))",
          layout: false
      end
    end
  end

  def update_order_item_quantity
    session[:cart][params[:product_id]]["quantity"] = params[:quantity]
    respond_to do |format|
      format.html{redirect_to cart_path}
      format.js
    end
  end

  def store_cart_cookies
    cookies[:cart] = {value: JSON.generate(session[:cart]),
                      expires: Settings.carts.cookie_expiry}
  end

  def add_to_session_cart
    product_id = params[:order_item][:product_id]
    session[:cart][product_id] = {quantity: params[:order_item][:quantity],
                                  product_id: product_id}
  end

  def load_products_info
    @products = []
    session[:cart].keys.each do |id|
      @products.push(Product.basic_product_info.find_by(id: id))
    end
  end
end

class CartsController < ApplicationController
  before_action :current_cart
  before_action :load_products_info, only: :show

  def show
    @cart_items = session[:cart].values
  end

  private

  def load_products_info
    ids = session[:cart].keys.reject(&:blank?).map{|i| "'" + i.to_s + "'"}
                        .join(",")
    @products = Product.list_products_by_ids(ids)
  end
end

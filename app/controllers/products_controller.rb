class ProductsController < ApplicationController
  before_action :load_category, only: :index

  def index
    @products = Product.list_by_category(@category.id)
                       .order_by_name
                       .paginate(page: params[:page],
                          per_page: Settings.product.per_page)
  end

  def show
    @product = Product.find_by id: params[:id]
    if @product
      @order_item = OrderItem.new
    else
      flash[:danger] = t "controller.products.not_found"
      redirect_to categories_path
    end
  end

  private

  def load_category
    @category = Category.find_by id: params[:category_id]
    return if @category
    flash[:danger] = t "controller.categories.not_found"
    redirect_to categories_path
  end
end
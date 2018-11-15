class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i(index show)
  def index
    @categories = Category.parent_id_null_order_by_id
                          .includes :sub_categories
  end

  def show
    @category = Category.find_by id: params[:id]
    return render_404 unless @category
    load_products_for_category
    @order_item = OrderItem.new
  end

  def load_products_for_category
    @q = @category.products.ransack params[:q]
    @products = @q.result(distinct: true).paginate(page: params[:page],
      per_page: Settings.product.per_page)
  end
end

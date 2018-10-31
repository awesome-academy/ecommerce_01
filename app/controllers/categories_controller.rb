class CategoriesController < ApplicationController
  def index
    @categories = Category.parent_id_null_order_by_id
                          .includes :sub_categories
  end

  def show
    @category = Category.find_by id: params[:id]
    return render_404 unless @category
    @categories = @category.sub_categories
    return if @categories.present?
    redirect_to category_products_path(@category)
  end
end

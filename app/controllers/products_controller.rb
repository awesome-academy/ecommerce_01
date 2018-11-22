class ProductsController < ApplicationController
  before_action :current_cart
  before_action :current_user, only: :show
  after_action ->{store_recent_products(@product.id)}, only: :show

  def index
    @q = Product.ransack params[:q]
    @products = @q.result(distinct: true).paginate(page: params[:page],
      per_page: Settings.product.per_page)
    @q.build_condition if @q.conditions.blank?
    @q.build_sort if @q.sorts.blank?
    @order_item = OrderItem.new
  end

  def show
    @product = Product.find_by id: params[:id]
    if @product
      @order_item = OrderItem.new
      load_product_rating
    else
      flash[:danger] = t "controller.products.not_found"
      redirect_to categories_path
    end
  end

  private

  # def load_category
  #   @category = Category.find_by id: params[:category_id]
  #   return if @category
  #   flash[:danger] = t "controller.categories.not_found"
  #   redirect_to categories_path
  # end

  def load_product_rating
    @rating = if current_user &&
                 @product.ratings.following_user(current_user.id).present?
                @product.ratings.following_user(current_user.id).first
              else
                @product.ratings.new
              end
  end
end

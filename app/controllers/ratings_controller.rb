class RatingsController < ApplicationController
  before_action :set_forwarding, :check_logged_in, :current_user,
    :load_product, only: %i(create update)

  def create
    rating = params[:rating][:rating_value].to_s.to_i
    @rating = @product.ratings.new rating: rating
    @rating.user_id = current_user.id
    respond_to do |format|
      if @rating.save
        successful_response format
      else
        failed_response format
      end
    end
  end

  def update
    @rating = @product.ratings.following_user(current_user.id).first
    rating = params[:rating][:rating_value].to_s.to_i
    respond_to do |format|
      if @rating.update_attribute :rating, rating
        successful_response format
      else
        failed_response format
      end
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:product_id]
  end

  def set_forwarding
    session[:forwarding_url] = product_url(params[:product_id])
  end

  def successful_response format
    format.js{redirect_to @product}
  end

  def failed_response format
    format.js do
      render js: 'alert(I18n.t("js.rating.rate_failed"))', layout: false
    end
  end
end

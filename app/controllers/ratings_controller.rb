class RatingsController < ApplicationController
  before_action :check_logged_in
  before_action :set_forwarding, :check_logged_in, :current_user,
    :load_product, only: %i(create update)

  def create
    @rating = @product.ratings.new rating: rating_value
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
    respond_to do |format|
      if @rating.update_attribute :rating, rating_value
        successful_response format
      else
        failed_response format
      end
    end
  end

  def destroy
    @rating = @product.ratings.following_user(current_user.id).first
    return unless @rating
    respond_to do |format|
      format.html{redirect_to @product}
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:product_id]
  end

  def rating_value
    params[:rating_value].to_s.to_i
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

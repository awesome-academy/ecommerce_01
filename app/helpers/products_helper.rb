module ProductsHelper
  def show_current_rating
    return 0 if current_user.blank? ||
                current_user.ratings.following_product(params[:id]).blank?
    current_user.ratings.following_product(params[:id]).first.rating
  end

  def show_reviews
    return 0 if @product.ratings.blank?
    @product.ratings.count
  end

  def show_average
    return 0 if @product.ratings.average(:rating).blank?
    @product.ratings.average(:rating).round(1)
  end

  def show_five_star_reviews
    return 0 if @product.ratings.blank?
    @product.ratings.list_by_rating(Settings.rating.star.five).count
  end

  def show_four_star_reviews
    return 0 if @product.ratings.blank?
    @product.ratings.list_by_rating(Settings.rating.star.four).count
  end

  def show_three_star_reviews
    return 0 if @product.ratings.blank?
    @product.ratings.list_by_rating(Settings.rating.star.three).count
  end

  def show_two_star_reviews
    return 0 if @product.ratings.blank?
    @product.ratings.list_by_rating(Settings.rating.star.two).count
  end

  def show_one_star_reviews
    return 0 if @product.ratings.blank?
    @product.ratings.list_by_rating(Settings.rating.star.one).count
  end
end

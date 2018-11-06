class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  include SessionsHelper

  private

  def current_cart
    return if session[:cart]
    session[:cart] = cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end

  def store_recent_products product_id = ""
    recent_viewed_products = if cookies[:recent_products].present?
                               JSON.parse(cookies[:recent_products])
                             else
                               []
                             end
    if recent_viewed_products.size > Settings.recent_viewed_products
      recent_viewed_products.slice!(0)
    end
    recent_viewed_products.push product_id
    recent_viewed_products = recent_viewed_products.uniq.reject(&:blank?)
    cookies[:recent_products] = {
      value: JSON.generate(recent_viewed_products),
      expires: Settings.recent_products_expiration.hours.from_now
    }
  end

  def recently_viewed_products
    product_ids = if cookies[:recent_products].present?
                    JSON.parse(cookies[:recent_products])
                  else
                    []
                  end
    @recent_products = product_ids.map do |id|
      Product.basic_product_info.find_by id: id
    end
  end

  def render_404
    respond_to do |format|
      format.html do
        render file: "#{Rails.root}/public/404", layout: true,
          status: :not_found
      end
      format.xml{head :not_found}
      format.any{head :not_found}
    end
  end

  def render_400
    respond_to do |format|
      format.html do
        render file: "#{Rails.root}/public/500", layout: true,
          status: :internal_server_error
      end
      format.xml{head :not_found}
      format.any{head :not_found}
    end
  end
end

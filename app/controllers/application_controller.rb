class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, if: :devise_controller?
  helper_method :current_cart
  include SessionsHelper

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :email, :password,
      :password_confirmation]
    devise_parameter_sanitizer.permit :sign_in, keys: [:email, :password]
  end

  def check_logged_in
    return if logged_in?
    store_location
    flash[:info] = t "controller.checkouts.require_login"
    redirect_to login_path
  end

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

  def remove_order_info
    cookies.delete :order_info, domain: Settings.domain
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

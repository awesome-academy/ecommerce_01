class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_cart
  include SessionsHelper

  private

  def current_cart
    return if session[:cart]
    session[:cart] = cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
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

  def render_500
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

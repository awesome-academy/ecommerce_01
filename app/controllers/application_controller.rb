class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

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
end

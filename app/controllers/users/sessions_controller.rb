class Users::SessionsController < Devise::SessionsController

  protected

  def after_sign_in_path_for resource
    session[:forwarding_url] || root_path
    session.delete :forwarding_url
  end

  def respond_to_on_destroy
    session.delete :cart
    cookies.delete :cart, domain: Settings.domain
    remove_order_info
    super
  end

end

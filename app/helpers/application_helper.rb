module ApplicationHelper
  def full_title page_title
    base_title = I18n.t "helpers.application.base_title"
    page_title.blank? ? base_title : page_title + " | " + base_title
  end

  def cart_counter
    return session[:cart].keys.size if session[:cart].present?
    0
  end
end

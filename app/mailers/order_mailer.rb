class OrderMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.user_order_inform.subject
  #
  def user_order_inform order
    @order = order
    mail to: @order.user.email,
      subject: t("controller.order_mailer.user_inform", number: order.id)
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.admin_order_inform.subject
  #
  def admin_order_inform
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

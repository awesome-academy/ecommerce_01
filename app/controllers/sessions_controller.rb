class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = t "controllers.sessions.login_fail"
      render :new
    end
  end

  def destroy
    log_out
    remove_order_info
    redirect_to root_path
  end
end

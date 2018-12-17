class SessionsController < ApplicationController
  def new; end

  def email_params
    params[:session][:email]
  end

  def password_params
    params[:session][:password]
  end

  def remember_params
    params[:session][:remember_me]
  end

  def create
    user = User.find_by(email: email_params.downcase)
    if user && user.authenticate(password_params)
      if user.activated?
        log_in user
        remember_params == "1" ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
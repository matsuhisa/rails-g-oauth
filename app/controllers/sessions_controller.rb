class SessionsController < ApplicationController
  skip_before_action :require_sign_in

  def new
  end

  def create
    original_url = session[:original_url]
    reset_session

    session[:user_id] = request.env['omniauth.auth'][:info][:email]
    session[:user_image] = request.env['omniauth.auth'][:info][:image]

    redirect_to original_url || root_path
  end

  def destroy
    reset_session
    redirect_to sign_in_path
  end
end

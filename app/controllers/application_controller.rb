class ApplicationController < ActionController::Base
  layout :layout_by_login
  protect_from_forgery with: :exception
  before_action :current_user

  include SessionsHelper

  protected

  def layout_by_login
    if User.find_by(id: session[:user_id])
      'application'
    else
      'application_unlogin'
    end
  end

  private

  def require_login
    return if logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
  end

end

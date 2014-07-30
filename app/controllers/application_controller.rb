class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user, except: [:login, :pauth]

  def authenticate_user
    if session[:username].blank?
      redirect_to login_url
    end
  end
end


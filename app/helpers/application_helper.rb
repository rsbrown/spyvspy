module ApplicationHelper
  def logged_in?
    !session[:username].blank?
  end
end

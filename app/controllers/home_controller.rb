class HomeController < ApplicationController
  protect_from_forgery except: :pauth

  def login
    if request.post?
      if params[:username].blank?
        params[:username] = "Newb#{rand(100)}"
      else
        session[:username] = params[:username]
        redirect_to root_url
      end
    end
  end

  def pauth
    user_id = request.session_options[:id]
    response = Pusher[params[:channel_name]].authenticate(params[:socket_id], {
      user_id: user_id,
      user_info: {username: session[:username]}
    })
    render :json => response
  end

  def index
  end

end

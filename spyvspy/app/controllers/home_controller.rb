class HomeController < ApplicationController
  protect_from_forgery :except => :auth

  def auth
    user_id = request.session_options[:id]
    response = Pusher[params[:channel_name]].authenticate(params[:socket_id], {
      user_id: user_id,
      user_info: {}
    })
    render :json => response
  end

  def index
  end

end

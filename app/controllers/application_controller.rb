class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_header_auth_login

  protected
  def require_header_auth_login
    username = request.headers["x-username"]
    password = request.headers["x-password"]

    render :status => :unauthorized if login(username, password, true).nil?
  end

end

class Api::UsersController < ApplicationController
  respond_to :json

  skip_before_filter :require_header_auth_login, :only => [:create]

  def create

    puts params

    @user = User.new(params[:user])
    @user.save

    render status: 422 if !@user.errors.empty?
  end

end
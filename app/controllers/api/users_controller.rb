class Api::UsersController < ApplicationController
  respond_to :json



  def create
    @user = User.new(params[:user])
    @user.save
  end

end
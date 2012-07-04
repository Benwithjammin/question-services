class Api::ResponsesController < ApplicationController
  respond_to :json

  def create

    @response = Response.create_from_params(current_user, params)
    render status: 422 if !@response.errors.empty?

  end

end
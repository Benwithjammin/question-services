class Api::ResponsesController < ApplicationController
  respond_to :json

  def create

    puts params

    response = { user_id: params[:user_id], question_id: params[:question_id], answer_id: params[:answer_id] }

    @response = Response.new(response)

    @response.save


  end

end
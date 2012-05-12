class Api::QuestionsController < ApplicationController
  respond_to :json

  def create
      @question = Question.new(params[:question])
      @question.save
  end

end
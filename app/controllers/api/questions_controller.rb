class Api::QuestionsController < ApplicationController
  respond_to :json

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by_id params[:id]
  end

  def create
    @question = Question.new(params[:question])
    @question.save
  end

end
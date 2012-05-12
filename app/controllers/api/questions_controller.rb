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

  def by_user
    @questions = Question.all_by_user_id params[:id]
  end

end
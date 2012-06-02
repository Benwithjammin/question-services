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

    unless params[:answers].nil?
      params[:answers].each { |a| @question.add_answer(Answer.new(a)) }
    end

    @question.set_user_by_user_id(params[:user_id])
    @question.save

    render status: 422 if !@question.errors.empty?
  end

  def by_user
    @questions = Question.all_by_user_id params[:id]
  end

end
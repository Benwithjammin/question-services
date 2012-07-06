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

    @question.user = current_user
    @question.save

    render status: 422 if !@question.errors.empty?
  end

  def by_user
    @questions = Question.by_user_id params[:id]
  end

  def answered_by_user
    @questions = Question.answered_by_user params[:id]
    #@questions.each { | q | q.user_answer = current_user.id }
  end

  def unanswered_by_user
    @questions = Question.unanswered_by_user params[:id]
  end

end
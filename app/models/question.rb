class Question < ActiveRecord::Base

  attr_accessible :title, :image
  attr_reader :user_answer
  belongs_to :user
  has_many :answers
  default_scope order: :id

  validates :title, :user, presence: true
  validates :answers, length: { maximum: 26 }
  validates_associated :user, message: "Supplied user does not exist"

  def add_answer(answer)
    answer.question = self
    self.answers.push(answer)
  end

  def self.by_user_id(user_id)
     Question.where { user_id == user_id }.each{ |q| q.user_answer = user_id }.each{|q| q.user_answer = user_id }
  end

  def self.answered_by_user(user_id)
    Question.where { id >> Question.user_response_question_ids(user_id)}.each{|q| q.user_answer = user_id }
  end

  def self.unanswered_by_user(user_id)
    Question.where { id << Question.user_response_question_ids(user_id) }.each{|q| q.user_answer = user_id }
  end

  def user_answer=(user_id)
    selected_response = answers.joins { responses }.where{ responses.user_id == user_id }.first
    @user_answer = selected_response.nil? ? 0 : selected_response.id
  end

  private
  def self.user_response_question_ids(user_id)
    Response.where { user_id == user_id }.collect { |r| r.question_id }
  end

  #self.user = User.find_or_initialize_by_id(user_id)

end

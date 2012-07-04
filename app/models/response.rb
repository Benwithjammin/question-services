class Response < ActiveRecord::Base

  attr_accessible :question_id, :answer_id

  belongs_to :user
  belongs_to :question
  belongs_to :answer

  validates_presence_of :user, message: "User does not exist"
  validates_presence_of :question, message: "Question does not exist"
  validates_presence_of :answer, message: "Answer does not exist"

  def self.create_from_params(current_user, params)

    response = Response.new
    response.user = current_user
    response.update_attributes(params.slice("answer_id", "question_id"))

    #ask Nick is the above update_attribs prefrered to below and and should this be on model?
    #response.answer = Answer.find_by_id params[:answer_id]

    response.save

    return response

  end

end

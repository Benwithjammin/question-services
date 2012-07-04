class Response < ActiveRecord::Base

  attr_accessible :user_id, :question_id, :answer_id

  belongs_to :user
  belongs_to :question
  belongs_to :answer

end

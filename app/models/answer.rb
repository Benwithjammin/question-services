class Answer < ActiveRecord::Base

  include Math

  attr_accessible :text
  belongs_to :question
  has_many :responses

  validates :text, :question, presence: true
  #validates_associated :question, message: "Supplied question does not exist"

  def responses
    answer_count = Response.where(answer_id: self.id).count
    total =  Response.where(question.id == self.id).count

    puts total

    return Math.percentage(answer_count, total)
  end

end

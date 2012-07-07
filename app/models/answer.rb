class Answer < ActiveRecord::Base

  attr_accessible :text, :order
  belongs_to :question
  has_many :responses
  default_scope order: :order

  validates :text, :question, presence: true
  #validates_associated :question, message: "Supplied question does not exist"

  def percentage
    answer_count = Response.where(answer_id: self.id).count
    total =  Response.where(question.id == self.id).count

    percentage = total != 0 ? (answer_count / total.to_f) * 100 : 0

    return percentage.round(1)
  end

end

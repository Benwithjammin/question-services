class Answer < ActiveRecord::Base
  attr_accessible :text
  belongs_to :question

  validates :text, :question, presence: true
  validates_associated :question, message: "Supplied question does not exist"

end

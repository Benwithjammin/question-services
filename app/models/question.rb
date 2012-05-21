class Question < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :question_type

  scope :by_user_id, -> id { where { user_id == id }}

  QUESTION_TYPES = [ "text", "image" ]

  validates :title, :user, presence: true
  validates :question_type, inclusion: QUESTION_TYPES
  validates_associated :user, message: "Supplied user does not exist"
end

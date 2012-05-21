class Question < ActiveRecord::Base
  belongs_to :user
  attr_accessible :title, :question_type

  scope :all_by_user_id, -> id { where { user_id == id }}

  QUESTION_TYPES = [ "text", "image" ]

  validates :title, presence: true
  validates :question_type, inclusion: QUESTION_TYPES
  validates_associated :user
end

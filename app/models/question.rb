class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  attr_accessible :title, :question_type
  #accepts_nested_attributes_for :answers

  scope :by_user_id, -> id { where { user_id == id }}

  QUESTION_TYPES = [ "text", "image" ]

  validates :title, :user, presence: true
  validates :answers, length: { minimum: 1 }
  validates :answers, length: { maximum: 26 }
  validates :question_type, inclusion: QUESTION_TYPES
  validates_associated :user, message: "Supplied user does not exist"

  def add_answer(answer)
    answer.question = self
    self.answers.push(answer)
  end

  def set_user_by_user_id(user_id)
    unless user_id.nil?
      self.user = User.find_or_initialize_by_id(user_id)
    end
  end

end

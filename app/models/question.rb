class Question < ActiveRecord::Base

  attr_accessible :title, :question_type
  belongs_to :user
  has_many :answers
  has_many :responses

  QUESTION_TYPES = [ "text", "image" ]

  scope :by_user_id, -> id { where { user_id == id }}
  scope :answered_by_user, -> id { joins { answers.responses }.where{ answers.responses.user_id >> id }.uniq }
  scope :unanswered_by_user, -> id { joins { answers.responses }.where{ answers.responses.user_id << id }.uniq }

  validates :title, :user, presence: true
  validates :answers, length: { maximum: 26 }
  validates :question_type, inclusion: QUESTION_TYPES
  validates_associated :user, message: "Supplied user does not exist"

  def add_answer(answer)
    answer.question = self
    self.answers.push(answer)
  end

  #self.user = User.find_or_initialize_by_id(user_id)

end

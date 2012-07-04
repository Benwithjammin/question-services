class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :name, :email, :password, :password_confirmation
  has_many :questions
  has_many :responses

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_length_of :password, :minimum => 5, :message => "password must be at least 5 characters long", :if => :password
  validates_presence_of :email
  validates_uniqueness_of :email

  def questions
    Question.where(user_id: self.id)
  end

end

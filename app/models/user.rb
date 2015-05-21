class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :room

  has_many :questions
  has_many :question_voters
  has_many :rooms_users, :dependent => :destroy

  def email_required?
    false
  end

  def email_changed?
    false
  end

end

class Question < ActiveRecord::Base

  belongs_to :room
  belongs_to :user

  has_many :question_voters, :dependent => :destroy


end

class Room < ActiveRecord::Base

  has_many :rooms_users, :dependent => :destroy
  has_many :questions, :dependent => :destroy

  accepts_nested_attributes_for :rooms_users, :reject_if => lambda { |a| a[:user_id].blank? },  :allow_destroy => true
end

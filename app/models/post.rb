class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :content

  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user

  def find_like(user)
    self.likes.where( :user_id => user.id ).first
  end

  belongs_to :category, :optional => true
end

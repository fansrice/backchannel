class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password
  has_many :posts
  has_many :post_comments
  has_many :comment_votes
  has_many :post_votes
end

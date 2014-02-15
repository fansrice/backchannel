class PostComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :comment_votes, :dependent => :destroy
  validates :body, presence: true
end

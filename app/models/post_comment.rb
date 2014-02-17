class PostComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, :counter_cache => :comments_count, :foreign_key => :post_id, :primary_key => :id
  has_many :comment_votes, :dependent => :destroy
  validates :body, presence: true
end

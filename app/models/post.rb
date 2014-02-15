class Post < ActiveRecord::Base
  #attr_accessible :title, :body
  validates :title, :body, :category_id, presence:true
  belongs_to :category
  belongs_to :user
  has_many :post_comments, :dependent => :destroy
  has_many :post_votes, :dependent => :destroy
end

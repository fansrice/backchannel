class Post < ActiveRecord::Base
  #attr_accessible :title, :body
  validates :title, :body, :category_id, presence:true
  belongs_to :category
end

class CommentVote < ActiveRecord::Base
  belongs_to :post_comment
  belongs_to :user
end

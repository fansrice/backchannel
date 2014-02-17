class TypicalUserController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @post_counts = Post.where(:auther_id => session[:user_id])
    @comment_counts = PostComment.where(:commentor_id => session[:user_id])
    @posts = Post.where(:auther_id => session[:user_id])
    @postvotes = PostVote.where(:voter_id => session[:user_id])
    @commentvotes = CommentVote.where(:voter_id => session[:user_id])
  end
end

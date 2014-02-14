class PostpoolController < ApplicationController
  skip_before_action :authorize
  def index
    @posts = Post.order(:title)
  end
end

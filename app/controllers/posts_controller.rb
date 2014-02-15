class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:index, :show]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new(:post => @post)
    @post_comments = PostComment.find(:all, :conditions => { :post_id => params[:id] })
    @post_vote = PostVote.new(:post => @post)
    @post_votes = PostVote.find(:all, :conditions => { :post_id => params[:id]})
  end

  # GET /posts/new
  def new
    @post = Post.new
    @category = Category.all
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    #if (User.find_by(id: session[:user_id]).admin_type != nil)      
      #if(@post.auther_id != session[:user_id])
      #flash[:notice] = "Cannot edit a post that you did not post."
      #redirect_to(:controller => "posts", :action => "show")
    if (@post.auther_id == session[:user_id])||(User.find_by(id: session[:user_id]).admin_type != nil) 
    else 
      flash[:notice] = "Cannot edit a post that you did not post."
      redirect_to(:controller => "posts", :action => "show")
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :auther_id)
    end
end

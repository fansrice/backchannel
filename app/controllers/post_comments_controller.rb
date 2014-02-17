class PostCommentsController < ApplicationController
  #before_action :set_post_comment, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: :index

  # GET /post_comments
  # GET /post_comments.json
  def index
    @post_comments = PostComment.all
  end

  # GET /post_comments/1
  # GET /post_comments/1.json
  def show
    @post_comment = PostComment.find(params[:id])
  end

  # GET /post_comments/new
  def new
    @post_comment = PostComment.new
  end

  # GET /post_comments/1/edit
  def edit
    @post_comment = PostComment.find(params[:id])
  end

  # POST /post_comments
  # POST /post_comments.json
  #def create
    #@post_comment = PostComment.new(post_comment_params)

    #respond_to do |format|
      #if @post_comment.save
      #  format.html { redirect_to @post_comment.post, notice: 'Post comment was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @post_comment }
     # else
     #   format.html { render action: 'new' }
     #   format.json { render json: @post_comment.errors, status: :unprocessable_entity }
     #   redirect_to @post_comment.post
    #  end
   # end
  #end
  def create
    @post_comment = PostComment.new(post_comment_params)
    if @post_comment.save
      ;flash[:notice] = 'Comment was successfully created.'
      redirect_to(@post_comment.post)
    else
      flash[:notice] = "Your comment should contain something."
      redirect_to(@post_comment.post)
    end
  end

  # PATCH/PUT /post_comments/1
  # PATCH/PUT /post_comments/1.json
  def update
    @post_comment = PostComment.find(params[:id])
    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.html { redirect_to @post_comment.post, notice: 'Post comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_comments/1
  # DELETE /post_comments/1.json
  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    flash[:notice] = "Comment is successfully deleted!"
    redirect_to(@post_comment.post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_comment_params
      params.require(:post_comment).permit(:commentor_id, :body, :user_id, :post_id)
    end
end

class PostVotesController < ApplicationController
  #before_action :set_post_vote, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: :index

  # GET /post_votes
  # GET /post_votes.json
  def index
    @post_votes = PostVote.all
  end

  # GET /post_votes/1
  # GET /post_votes/1.json
  def show
  end

  # GET /post_votes/new
  def new
    @post_vote = PostVote.new
  end

  # GET /post_votes/1/edit
  def edit
  end

  # POST /post_votes
  # POST /post_votes.json
  def create
    @post_vote = PostVote.new(post_vote_params)
    @post_votes = PostVote.where(:post_id => @post_vote.post_id)
    @posts = Post.all
      if @post_votes.find_by(voter_id: session[:user_id]) != nil
        flash[:notice] = 'Cannot vote anymore!'
        redirect_to(@post_vote.post)
      elsif @posts.find_by(id: @post_vote.post_id).auther_id == session[:user_id]
        flash[:notice] = "Cannot vote the post created by you!"
        redirect_to(@post_vote.post)
      else
        @post_vote.save
        flash[:notice] = 'Successfully voted!'
        redirect_to(@post_vote.post)
    end
  end

  # PATCH/PUT /post_votes/1
  # PATCH/PUT /post_votes/1.json
  def update
    respond_to do |format|
      if @post_vote.update(post_vote_params)
        format.html { redirect_to @post_vote, notice: 'Post vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_votes/1
  # DELETE /post_votes/1.json
  def destroy
    @post_vote.destroy
    respond_to do |format|
      format.html { redirect_to post_votes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_vote
      @post_vote = PostVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_vote_params
      params.require(:post_vote).permit(:voter_id, :quantity, :post_id, :user_id)
    end
end

class CommentVotesController < ApplicationController
  before_action :set_comment_vote, only: [:show, :edit, :update, :destroy]

  # GET /comment_votes
  # GET /comment_votes.json
  def index
    @comment_votes = CommentVote.all
  end

  # GET /comment_votes/1
  # GET /comment_votes/1.json
  def show
  end

  # GET /comment_votes/new
  def new
    @comment_vote = CommentVote.new
  end

  # GET /comment_votes/1/edit
  def edit
  end

  # POST /comment_votes
  # POST /comment_votes.json
  def create
    @comment_vote = CommentVote.new(comment_vote_params)

    respond_to do |format|
      if @comment_vote.save
        format.html { redirect_to @comment_vote, notice: 'Comment vote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment_vote }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_votes/1
  # PATCH/PUT /comment_votes/1.json
  def update
    respond_to do |format|
      if @comment_vote.update(comment_vote_params)
        format.html { redirect_to @comment_vote, notice: 'Comment vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_votes/1
  # DELETE /comment_votes/1.json
  def destroy
    @comment_vote.destroy
    respond_to do |format|
      format.html { redirect_to comment_votes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_vote
      @comment_vote = CommentVote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_vote_params
      params.require(:comment_vote).permit(:voter_id, :quantity, :post_comment_id, :user_id)
    end
end

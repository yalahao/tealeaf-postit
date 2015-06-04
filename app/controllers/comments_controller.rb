class CommentsController < ApplicationController

  before_action :require_user

  def create
    @comment = Comment.create(comment_params)
    @post = Post.find_by slug: params[:post_id]
    @comment.post = @post
    @comment.creator = current_user
    if @comment.save
      flash[:notice] = "Comment saved"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end

  def vote
    @comment = Comment.find(params[:id])
    @vote = Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])

    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = "Your vote was counted."
        else
          flash[:error] = "You can only vote once per item."
        end
        redirect_to :back
      end
      format.js
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

end
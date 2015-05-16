class CommentsController < ApplicationController

  before_action :require_user

  def create
    @comment = Comment.create(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.creator = current_user
    if @comment.save
      flash[:notice] = "Comment saved"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

end
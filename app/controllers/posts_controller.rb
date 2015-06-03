class PostsController < ApplicationController

  before_action :get_post, only: [:show, :edit, :update, :vote, :vote_count]
  before_action :require_user, except: [:index, :show]
  before_action :require_creator, only: [:edit]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.creator = current_user
    if @post.save
      flash[:notice] = "Post created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end
  
  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post updated."
      redirect_to post_path
    else
      render :edit
    end
  end

  def vote
    @vote = Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
    if @vote.valid?
      flash[:notice] = "Your vote was counted."
    else
      flash[:error] = "You can only vote once per item."
    end
    redirect_to :back
  end


  private

    def post_params
      params.require(:post).permit(:title, :description, :url, category_ids:[])
    end

    def get_post
      @post = Post.find(params[:id])
    end

    def require_creator
      if @post.creator != current_user
        flash[:error] = "You are not allowed to do that."
        redirect_to :back
      end
    end

end 

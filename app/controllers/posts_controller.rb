class PostsController < ApplicationController
  
  before_action :get_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.creator = User.first
    if @post.save
      flash[:notice] = "Post created."
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
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

  private

    def post_params
      params.require(:post).permit(:title, :description, :url)
    end

    def get_post
      @post = Post.find(params[:id])
    end

end 
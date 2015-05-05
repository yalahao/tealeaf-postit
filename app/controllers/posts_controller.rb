class PostsController < ApplicationController

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
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.update(Post.find(params[:id]), post_params)
    if @post.save
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

end 
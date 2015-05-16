class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You have successfully registered!"
      session[:user_id] = User.find_by username: user_params[:username]
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def get_user
      @user = User.find(params[:id])
    end

    def require_same_user
      if current_user != @user
        flash[:error] = "You are not allowed to do that."
        redirect_to root_path
      end
    end

end
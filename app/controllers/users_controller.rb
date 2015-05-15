class UsersController < ApplicationController

  before_action :get_user, only: [:show, :update]

  def new 
    @user = User.new
  end 

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Successfully registered. You can log in now."
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
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

end
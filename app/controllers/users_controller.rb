class UsersController < ApplicationController

 before_action :authenticate_user!
  def show
  	  @user = User.find(current_user.id)
      @books = Book.all
      @book = Book.new
  end

  def edit
  	  @user = User.find(params[:id])
  end
  	
  def update
  	  @user = User.find(params[:id])
  	  @user.update(user_params)
  	  redirect_to user_path(current_user.id)
  	
  end

  def index
  	  @users = User.all
  	  @user = User.find(current_user.id)
  end

  private

  def user_params
  	  params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

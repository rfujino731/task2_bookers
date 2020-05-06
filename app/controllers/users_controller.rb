class UsersController < ApplicationController

 before_action :authenticate_user!
  def show
    @myuser = User.find(current_user.id)
    @linkuser = User.find(params[:id])
    if @myuser == @linkuser
  	   @user = User.find(current_user.id)
       @books = Book.where(user_id:@user)
       @book = Book.new
    else
      @user = User.find(params[:id])
       @books = Book.where(user_id:@user)
       @book = Book.new
    end
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

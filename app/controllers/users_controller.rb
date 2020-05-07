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
      @book =Book.new
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
         redirect_to(book_path(@book.id), notice:'book was successfully created')
      else
        @books = Book.all
        @user = User.find(current_user.id)
        render "users/index"
      end
    
  end

  private

  def user_params
  	  params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

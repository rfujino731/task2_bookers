class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
		@user = User.find(current_user.id)
	end

	def show
		@login_user_id = current_user.id
		@book = Book.find(params[:id])

		if @login_user == @book.user_id
		   @user = User.find(@book.user_id)
		else
		   @user = User.find(@book.user_id)
		end
	end


	def edit
		@book = Book.find(params[:id])
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		   redirect_to(book_path(@book.id), notice:'book was successfully created')
		 else
		   @books = Book.all
		   @user = User.find(current_user.id)
		   render :show
		end
	end

	# def destroy
	# 	@book = Book.find(params[:id])
	# 	@book.destroy
	# 	redirect_to :index, notice:'book was successfully deleted'
	# end
		

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		   redirect_to(book_path(@book.id), notice:'book was successfully created')

		else
			render :edit
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to(books_path, notice:'book was successfully deleted')
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end

class BooksController < ApplicationController

	def index
		@books = Book.all
	end

	def show
		@book = Book.find(params[:id])
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
		   render :show
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to :index, notice:'book was successfully deleted'
	end
		

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
		redirect_to(books_path, notice:'book was successfully dekted')
	end

	private

	def book_params
		params.require(:book).permit(:title, :body)
	end
end

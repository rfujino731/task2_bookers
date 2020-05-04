class HomesController < ApplicationController
	def new
	end

	def create
	end

	def index
	end

	def show
		@user = User.find(params[:id])
	end

	private
  	def user_params
  	  	params.require(:user).permit(:name, :profile_image)
  	end
end

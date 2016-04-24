class UsersController < ApplicationController
	#before_filter :find_user

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to Bloger #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your account has been update!"
			redirect_to articles_path
		else

		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end
	
end
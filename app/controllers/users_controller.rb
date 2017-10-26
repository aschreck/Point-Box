class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end 

	def new
		@user = User.new
	end 

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to user_path(@user)
		else 
			render :new
		end 
	end 
	
	def edit
		@user = User.find(params[:id])
		@user.update_attribute(:available_points, params[:user][:available_points])
		redirect_to admin_users_path
	end 
	#feels like bad form—-unsure how to deal with multiple patch requests coming into this controller from admin and from purchase
	def update
		@user = User.find(params[:id])
	end 

	def purchase
		#this route is laid out in the controller but might not be what I actually want to do. 
	end 

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end 
end

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
	
	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end 
end

class SessionsController < ApplicationController

	def create
		user = User.find_by(username: params[:session][:username])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			if user.role == "admin"
				redirect_to admin_users_path(user)
			else  
				redirect_to user_path(user)
			end 
		else 
			render :new
		end 
	end 

	def destroy

	end 
end

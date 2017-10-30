class Admin::UsersController < Admin::BaseController
	before_action :require_admin
	def index
		@users = User.all
	end 

	def edit
		@user = User.find(params[:id])
	end 

	def update
		user = User.find(params[:id])
		user.update(user_params)
		byebug
		redirect_to admin_users_path
	end 

	def destroy
		user = User.find(params[:id])
		user.destroy

		redirect_to admin_users_path
	end 

	def require_admin
		render file: "/public/404" unless current_admin?
	end 

	private 

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end 

end 

class Admin::UsersController < Admin::BaseController
	before_action :require_admin
	def index
		@users = User.all
	end 

	def require_admin
		render file: "/public/404" unless current_admin?
	end 

end 

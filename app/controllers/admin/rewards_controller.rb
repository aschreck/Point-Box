class Admin::RewardsController < Admin::BaseController
  before_action :require_admin

	def new
		@reward = Reward.new
	end 

	def create
		@reward = Reward.create(reward_params)
		redirect_to admin_rewards_path
	end 

	def edit
		@reward = Reward.find(params[:id])
	end 

	def update
		@reward = Reward.find(params[:id])
		@reward.update(reward_params)
		redirect_to admin_rewards_path
	end 

	def index
		@rewards = Reward.all
	end 

	def destroy
		Reward.find(params[:id]).destroy
		redirect_to admin_rewards_path
	end 
	
	private 

	def reward_params
		params.require(:reward).permit(:name,:description, :price)
	end 
end 

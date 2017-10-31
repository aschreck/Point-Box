class RewardsController < ApplicationController
	def index
		@rewards = Reward.all
	end 

	def edit 
		user = User.find(session[:user_id])
		reward = Reward.find(params[:id])
		user.user_rewards.create(reward_id: reward.id)
		user.spend_points(reward.price)		
		redirect_to rewards_path
	end 
end

class RewardsController < ApplicationController
	def index
		@rewards = Reward.all
	end 

	def edit 
		user = User.find(session[:user_id])
		reward = Reward.find(params[:id])
		 #associate the reward with the user. 										 
		user.user_rewards.create(reward_id: reward.id)
		#also augment user.available points 
#		user.update_attribute(:available_points, (user.available_points - reward.price))
		user.spend_points(reward.price)		
#		user.update_attribute(:spent_points, (user.spent_points += reward.price))
		redirect_to rewards_path
	end 
end

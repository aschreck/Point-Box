class User < ApplicationRecord
	validates :username, presence: true, length: {maximum:50}
	validates :email, presence: true, length: {maximum:250}, uniqueness: true
	validates :password, presence: true, length: {minimum: 6}

	has_many :user_rewards
	has_many :rewards, through: :user_rewards
	has_secure_password

	enum role: ["default", "admin"]

	def add_points(points)
		self.available_points += points
	end

	def spend_points(points)
		self.update_attribute(:available_points, (self.available_points - points)) 
		self.update_attribute(:spent_points, (self.spent_points + points))
	end 

	def rewards
		return nil if self.user_rewards.nil?
		user_rewards = self.user_rewards
		user_rewards.map do |user_reward|
			Reward.find(user_reward.reward_id)
		end 
	end 
end

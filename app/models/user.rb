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
		self.available_points -= points
		self.spent_points += points
	end 
end

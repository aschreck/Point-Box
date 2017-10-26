describe "when a user clicks the purchase button on a reward" do
	it "associates that reward with that user through user_rewards" do
		user = build(:user)
		user.save
		reward = build(:reward)
		reward.save
		
		expect(user.available_points).to eq 1000

		visit "/rewards"
		click_link "Purchase"

		expect(user.available_points).to eq (user.available_points - reward.price)
		expect(user.user_rewards.first.reward_id).to eq reward.id
	end 
end 



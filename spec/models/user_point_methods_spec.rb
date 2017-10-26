describe "when point methods are called on a user" do
	it "adds points to the user's available points" do
		user = build(:user)

		user.add_points(1000)

		expect(user.available_points).to eq 2000
	end 

end 

describe "When a user fills out a form and hits create" do
	it "stores them in the database as a new user" do
		visit '/signup'

		fill_in "user[username]",             with: "Aaron"
		fill_in "user[email]",                 with: "aaron@rails.com"
		fill_in "user[password]",              with: "password"
		fill_in "user[password_confirmation]", with: "password"
	
		click_button "Create"
		user = User.first
		expect(User.all.count).to eq 1

		expect(current_path).to eq user_path(user)

	end 
end 

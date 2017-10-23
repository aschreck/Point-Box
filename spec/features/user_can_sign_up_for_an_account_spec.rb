describe "When a user fills out a form and hits create" do
	it "stores them in the database as a new user" do
		visit '/signup'

		fill_in "user[name]",                  with: "Aaron"
		fill_in "user[email]",                 with: "aaron@fail.com"
		fill_in "user[password]",              with: "password"
		fill_in "user[password_confirmation]", with: "password"
	
		click_button "Create"
		expect(User.all.count).to eq 1
	end 
end 

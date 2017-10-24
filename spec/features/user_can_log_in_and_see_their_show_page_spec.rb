describe "when a user visits the login page and they input valid credentials" do
	it "a session is created and they see their show page" do
		user = build(:user)
		visit '/login'

		fill_in "session[username]", with: user.username
		fill_in "session[password]", with: user.password
		
		expect(page).to have_content("Log in")
	end 
end

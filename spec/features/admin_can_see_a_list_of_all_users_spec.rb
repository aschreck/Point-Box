describe "when an admit logs into their page" do
	it "displays all active users" do
		#User.create(username: "Dogs", email: "dog@dog.edu", password: "password", role: 0)
		
		
		admin = User.create(username: "penelope",
		password: "password",
		role: 1)
		
		allow_any_instance_of(ApplicationController).to receive(:current_user)
		visit admin_users_path
		expect(page).to have_content("All Users")
	end 
end

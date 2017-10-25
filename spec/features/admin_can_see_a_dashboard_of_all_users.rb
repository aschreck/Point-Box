describe "when an admin navigates to admin index  page" do
	it "sees an index of all existing users" do
		visit "/admin"
		
		admin = User.create(username: "penelope",
												password: "password",
												role: 1)
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

		visit admin_users_path
		expect(page).to have_content("All Users")
	end 

end 

describe "When a default user tries to access admin pages" do
	it "they see a 404 instead" do
		user = build(:user)
		
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
		visit admin_users_path
		expect(page).to_not have_content("All Users")
	end
end 

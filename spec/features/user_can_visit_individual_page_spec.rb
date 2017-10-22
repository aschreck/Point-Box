describe "user can access their profile view" do
	it "user can reach their individual page via the url" do
		user = User.create(name: "Rick", email: "picklerick@gmail.com",
								password: "foobar", password_confirmation: "foobar")
		visit user_path(user)
		expect(page).to have_content("Rick")
	end 
end 

describe "when an admin navigates to admin index  page" do
	it "sees an index of all existing users" do
		visit "/admin"

		expect(page).to have_content("All Users")
	end 

end 

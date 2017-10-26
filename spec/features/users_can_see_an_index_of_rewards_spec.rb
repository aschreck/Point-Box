describe "When a user visits /rewards" do
  it "they see the rewards page" do
 		visit '/rewards'

		expect(page).to have_content("Available Rewards")
  end 

	it "they can see specific listed rewards" do
		visit '/rewards'
		Reward.create(name: "Used Birkenstocks", description: "Sandals with minor sweat stains around the sole", price: 500)
		
		expect(page).to have_content("Used Birkenstocks")
		expect(page).to have_content(500)

	end 
end 

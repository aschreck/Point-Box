describe "user can see the home page" do
  it "user sees home page" do
    visit "/"

    expect(page).to have_content("Welcome")
  end 
end 
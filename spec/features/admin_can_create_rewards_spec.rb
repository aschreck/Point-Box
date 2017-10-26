describe "when an admin visits admin_rewards_path" do
  it "and submits a form, a new reward is created" do
    visit new_admin_reward_path

    fill_in 'reward[name]', with: "Princess Leia Hat"
    fill_in 'reward[description]', with: "Sucks and will take hours to find"
    fill_in 'reward[price]', with: 100000

    click_on "Submit"

    expect(Reward.all.count).to eq 1 
  end 
end

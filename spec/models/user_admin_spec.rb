
describe User do
  it "can be created as an admin" do
    user = User.create(username: "penelope",
                       password: "boom",
                       role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "can be created as a default user by default" do
    user = User.create(username: "sammy",
                       password: "pass",
                       role: 0)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end

require 'rails_helper'

describe "User validations" do
	it "a user must have a username" do
		User.create()

		expect(User.all.count).to eq 0
		
		User.create(username: "Aaron", email: "codelord6969@yahoo.com",
							 password: "foobar", password_confirmation: "foobar")

		expect(User.all.count).to eq 1
	end 

	it "cannot have a username that is over 50 chars" do 
		badusername = "a" * 51
		User.create(username: badusername, email: "dogs@dog.com",
							 password: "foobar", password_confirmation: "foobar")

		expect(User.all.count).to eq 0
	end 

	it "cannot have an email that is above 250 chars" do
		badaddress = "a" * 244 + '@example.com'
		User.create(username: "Frank", email: badaddress,
							 password: "foobar", password_confirmation: "foobar")

		expect(User.all.count).to eq 0 
	end 

	it "enforces uniqueness" do
		User.create(username: "Rick", email: "picklerick@gmail.com",
							 password: "foobar", password_confirmation: "foobar")
		User.create(username: "Rick", email: "picklerick@gmail.com",
							 password: "foobar", password_confirmation: "foobar")

		expect(User.all.count).to eq (1)
	end 

	it "enforces a 6 character mimimum on passwords" do
		User.create(username: "Rick", email: "picklerick@gmail.com",
							 password: "foo", password_confirmation: "foo")
		
		expect(User.all.count).to eq 0
end 
end 

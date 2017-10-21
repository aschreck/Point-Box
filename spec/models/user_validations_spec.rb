require 'rails_helper'

describe "User validations" do
	it "a user must have a name" do
		User.create()

		expect(User.all.count).to eq 0
		
		User.create(name: "Aaron", email: "codelord6969@yahoo.com",
							 password: "foobar", password_confirmation: "foobar")

		expect(User.all.count).to eq 1
	end 

	it "cannot have a name that is over 50 chars" do 
		badname = "a" * 51
		User.create(name: badname, email: "dogs@dog.com",
							 password: "foobar", password_confirmation: "foobar")

		expect(User.all.count).to eq 0
	end 

	it "cannot have an email that is above 250 chars" do
		badaddress = "a" * 244 + '@example.com'
		User.create(name: "Frank", email: badaddress,
							 password: "foobar", password_confirmation: "foobar")

		expect(User.all.count).to eq 0 
	end 

	it "enforces uniqueness" do
		User.create(name: "Rick", email: "picklerick@gmail.com",
							 password: "foobar", password_confirmation: "foobar")
		User.create(name: "Rick", email: "picklerick@gmail.com",
							 password: "foobar", password_confirmation: "foobar")

		expect(User.all.count).to eq (1)
	end 

	it "enforces a 6 character mimimum on passwords" do
		User.create(name: "Rick", email: "picklerick@gmail.com",
							 password: "foo", password_confirmation: "foo")
		
		expect(User.all.count).to eq 0
end 
end 

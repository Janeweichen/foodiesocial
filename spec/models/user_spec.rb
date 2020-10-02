require 'rails_helper'

RSpec.describe User, type: :model do
   it "is valid with a name, email, and password" do
    user = User.new(
      name: 'Allen',
      email: 'giantjaeger@japan.com',
      password: '123456'
    )
    expect(user).to be_valid
   end

   it "is invalid without a name" do
     user = User.new(name: nil)
     user.valid?
     expect(user.errors[:name]).to_not include('can not be balnk')
   end

   it "is invalid without an email address"
   
   it "is invalid with a duplicate email address" do
      User.create(
        name: 'Allen',
        email: 'giantjaeger@japan.com',
        password: '123456'    
     )  
     user = User.new(
       name: 'Jaeger',
       email: 'giantjaeger0@japan.com',
       password: '123456'    
     )  
     user.valid?
     expect(user.errors[:email]).to include("this email has already taken")
   end

   it "returns a user's full name as a string"
end

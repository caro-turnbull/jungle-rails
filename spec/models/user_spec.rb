require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should require a name' do
      @user = User.new(name: nil, email: 'a@a.com', password: 'a1b2c3')
      @user.save
      expect(@user.errors.full_messages).to include ("Name can't be blank")
    end
    it 'should require an email' do
      @user = User.new(name: "Testing User", email: nil, password: 'a1b2c3')
      @user.save
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it 'should require a password' do
      @user = User.new(name: "Testing User", email: 'a@a.com', password: nil)
      @user.save
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
    it 'should require a password confimration' do
      @user = User.new(name: "Testing User", email: 'a@a.com', password: "a1b2c3", password_confirmation: nil)
      @user.save
      expect(@user.errors.full_messages).to include ("Password confirmation can't be blank")
    end
    it 'should have a password with minimum length' do
      @user = User.new(name: "Testing User", email: 'a@a.com', password: "1", password_confirmation: "1")
      @user.save
      expect(@user.errors.full_messages).to include (/Password is too short/)
    end
    it 'should having matching password and confirmation' do
      @user = User.new(name: "Testing User", email: 'a@a.com', password: "a1b2c3", password_confirmation: "abcxyz")
      @user.save
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do 
      @email = "a@a.com"
      @password = "a1b2c3"
      user = User.create(name:"Testing User", email: @email, password: @password, password_confirmation: @password)
    end

    xit 'should have unique email' do
      @user1 = User.create(name: "Testing User1", email: 'a@a.com', password: "a1b2c3", password_confirmation: "a1b2c3")
      @user1.save
      @user2 = User.new(name: "Testing User2", email: 'a@a.com', password: "abcxyz", password_confirmation: "abcxyz")

      expect(@user2.id).not_to be_present
      expect(@user2.errors.full_messages).to include("has already been taken")
    end
    it 'should accept emails with incorrect case' do
      @user = User.authenticate_with_credentials("A@a.COM", @password)
      expect(@user).to be_a(User)
    end
    it 'should ignore spaces in email addresses' do
      @user = User.authenticate_with_credentials("  a@a.com  ", @password)
      expect(@user).to be_a(User)
    end
    it "should not allow an invalid password" do
      user = User.authenticate_with_credentials(@email, "123abc")
      expect(user).to eq(nil)
    end
   
  end

end

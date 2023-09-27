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
  end

  describe '.authenticate_with_credentials' do
    xit 'should having matching password and confirmation' do
    end
    xit 'should have unique email' do
    end
    xit 'should accept emails with incorrect case' do
    end
    xit 'should ignore spaces in email addresses' do
    end
   
  end

end

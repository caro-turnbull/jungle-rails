require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should require a first name' do
    end
    xit 'should require a last name' do
    end
    xit 'should require an email' do
    end
    xit 'should require a password' do
    end
    xit 'should require a password confimration' do
    end
    xit 'should have a password with minimum length' do
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

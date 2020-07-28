require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save when password and password_confirmation are identical' do
      @user = User.new(
        firstName: 'Jalayna',
        lastName: "Tipantiza",
        email: 'rheemat@gmail.com',
        password:'helloworld',
        password_confirmation:'helloworld'
      )
      expect(@user.valid?).to be true
    end
    it 'should save when password and password_confirmation are NOT identical' do
      @user = User.new(
        firstName: 'Jalayna',
        lastName: "Tipantiza",
        email: 'rheemat@gmail.com',
        password:'helloworld',
        password_confirmation:'wrong password'
      )
      expect(@user.valid?).to be false
    end
    it 'should have a unique email address' do
      @user1 = User.create(
        firstName: 'Jalayna',
        lastName: "Tipantiza",
        email: 'rheemat@gmail.com',
        password:'helloworld',
        password_confirmation:'helloworld'
      )
      @user2 = User.create(
        firstName: 'Jalayna',
        lastName: "Tipantiza",
        email: 'rheemat@gmail.com',
        password:'helloworld',
        password_confirmation:'helloworld'
      )
      
     expect(@user2.valid?).to be false
    end
  end
end


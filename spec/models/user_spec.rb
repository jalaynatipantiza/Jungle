require 'rails_helper'

RSpec.describe User, type: :model do
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
    it 'should have a case insensitive email' do
      @user1 = User.create(
        firstName: 'Jalayna',
        lastName: "Tipantiza",
        email: 'jalysa@gmail.com',
        password:'helloworld',
        password_confirmation:'helloworld'
      )
      @user2 = User.create(
        firstName: 'Jalayna',
        lastName: "Tipantiza",
        email: 'JALYSA@gmail.com',
        password:'helloworld',
        password_confirmation:'helloworld'
      )
      
     expect(@user2.valid?).to be false
    end
    it 'should error when email is blank' do
      @user = User.new(
        firstName: 'Jalayna',
        lastName: "Tipantiza",
        email: nil, 
        password:'helloworld',
        password_confirmation:'helloworld'
      )
      @user.save
      expect(@user.errors.full_messages).to eq(["Email can't be blank"])  
    end
    it 'should error when first name is blank' do
      @user = User.new(
        firstName: nil,
        lastName: "Tipantiza",
        email: 'jalysa@gmail.com',
        password:'helloworld',
        password_confirmation:'helloworld'
      )
      @user.save
      expect(@user.errors.full_messages).to eq(["Firstname can't be blank"])  
    end
    it 'should error when last name is blank' do
      @user = User.new(
        firstName: "Jalysa",
        lastName: nil,
        email: 'jalysa@gmail.com',
        password:'helloworld',
        password_confirmation:'helloworld'
      )
      @user.save
      expect(@user.errors.full_messages).to eq(["Lastname can't be blank"])  
    end
    it 'should have a minimum length of 6' do
      @user = User.create(
          firstName: 'Jalayna',
          lastName: "Tipantiza",
          email: 'rheemat@gmail.com',
          password:'1234',
          password_confirmation:'1234'
        )
        expect(@user.valid?).to be false
     end
  end
  describe '.authenticate_with_credentials' do
    it "should authenticate with credentials" do
      @user = User.create(
          firstName: 'Jalayna',
          lastName: "Tipantiza",
          email: 'rheemat@gmail.com',
          password:'5678910',
          password_confirmation:'5678910'
        )
        @user2 = User.authenticate_with_credentials('rheemat@gmail.com','5678910')
        expect(@user).to eq(@user2)
    end
    it "should not authenticate with credentials when given wrong passwords" do
      @user = User.create(
          firstName: 'Jalayna',
          lastName: "Tipantiza",
          email: 'rheemat@gmail.com',
          password:'tipantiza',
          password_confirmation:'tipantiza'
        )
        @user2 = User.authenticate_with_credentials('rheemat@gmail.com','wrong_tipantiza')
        expect(@user).not_to eql(@user2)
    end
    it 'should authenticate successfully when visitor types in a few spaces before and/or after their email address' do
      @user = User.create(
        firstName: 'Jalayna',
        lastName: "Tipantiza",
        email: 'rheemat@gmail.com',
        password:'tipantiza',
        password_confirmation:'tipantiza'
      )
      @user2 = User.authenticate_with_credentials(' rheemat@gmail.com ','tipantiza')
      expect(@user).to eql(@user2)
     
    end
    it 'should authenticate successfully when visitor types in random capitalized after their email address' do
      @user = User.create(
        firstName: 'Jalayna',
        lastName: "Tipantiza",
        email: 'rheemat@gmail.com',
        password:'tipantiza',
        password_confirmation:'tipantiza'
      )
      @user2 = User.authenticate_with_credentials('rhEEmaT@gmail.com','tipantiza')
      expect(@user).to eql(@user2)
    end
  end
end


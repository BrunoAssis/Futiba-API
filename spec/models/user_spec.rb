require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  
  it "is invalid without an e-mail" do
    FactoryGirl.build(:user, :email => nil).should_not be_valid
  end
  
  it "is invalid without a password" do
    FactoryGirl.build(:user, :password => nil).should_not be_valid
  end
  
  it "is invalid with a password smaller than 8 chars" do
    FactoryGirl.build(:user, :password => "a" * 7).should_not be_valid
  end
  
  it "does not allow two users with the same e-mail" do
    FactoryGirl.create(:user, :email => "test@test.com")
    FactoryGirl.build(:user, :email => "test@test.com").should_not be_valid
  end
end
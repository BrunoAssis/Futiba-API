require 'spec_helper'

describe Team do
  it "has a valid factory" do
    FactoryGirl.create(:team).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:team, :name => nil).should_not be_valid
  end
  
  it "does not allow two teams with the same name" do
    FactoryGirl.create(:team, :name => "Test Name")
    FactoryGirl.build(:team, :name => "Test Name").should_not be_valid
  end
end

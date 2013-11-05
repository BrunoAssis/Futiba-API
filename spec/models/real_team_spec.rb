require 'spec_helper'

describe RealTeam do
  it "has a valid factory" do
    FactoryGirl.create(:real_team).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:real_team, name: nil).should_not be_valid
  end
  
  it "is invalid without a fun name" do
    FactoryGirl.build(:real_team, fun_name: nil).should_not be_valid
  end
  
  it "does not allow two real teams with the same name" do
    FactoryGirl.create(:team, :name => "Test Name")
    FactoryGirl.build(:team, :name => "Test Name").should_not be_valid
  end
end

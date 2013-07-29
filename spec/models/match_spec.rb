require 'spec_helper'

describe Match do
  it "has a valid factory" do
    FactoryGirl.create(:match).should be_valid
  end
  
  it "is invalid without a date" do
    FactoryGirl.build(:match, :date => nil).should_not be_valid
  end
  
  it "does not allow a team to play with itself" do
    home_team = FactoryGirl.create(:team)
    away_team = home_team
    FactoryGirl.build(:match, :home_team => home_team, :away_team => away_team).should_not be_valid
  end
end

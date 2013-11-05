require 'spec_helper'

describe Player do
  it "has a valid factory" do
    FactoryGirl.create(:player).should be_valid
  end
  
  it "is invalid without a name" do
    FactoryGirl.build(:player, name: nil).should_not be_valid
  end
  
  it "is invalid without a number" do
    FactoryGirl.build(:player, number: nil).should_not be_valid
  end
  
  it "has only 3 valid positions, G, D, M and O" do
    FactoryGirl.build(:player, position: 'G').should be_valid
    FactoryGirl.build(:player, position: 'D').should be_valid
    FactoryGirl.build(:player, position: 'M').should be_valid
    FactoryGirl.build(:player, position: 'O').should be_valid
    FactoryGirl.build(:player, position: 'P').should_not be_valid
    FactoryGirl.build(:player, position: 'Q').should_not be_valid
    FactoryGirl.build(:player, position: 'R').should_not be_valid
  end
  
  it "is invalid with attributes smaller than 0" do
    FactoryGirl.build(:player, offense: -1).should_not be_valid
    FactoryGirl.build(:player, defense: -1).should_not be_valid
    FactoryGirl.build(:player, stamina: -1).should_not be_valid
  end
  
  it "is invalid with attributes bigger than 10" do
    FactoryGirl.build(:player, offense: 11).should_not be_valid
    FactoryGirl.build(:player, defense: 11).should_not be_valid
    FactoryGirl.build(:player, stamina: 11).should_not be_valid
  end
  
  it "is invalid without a valid real team" do
    valid_real_team = FactoryGirl.create(:real_team)
    invalid_real_team = FactoryGirl.build(:real_team, name: nil)

    FactoryGirl.build(:player, real_team: valid_real_team).should be_valid
    FactoryGirl.build(:player, real_team: invalid_real_team).should_not be_valid
  end
end

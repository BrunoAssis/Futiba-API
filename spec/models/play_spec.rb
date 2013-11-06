# coding: utf-8
require 'spec_helper'

describe Play do
  it "has a valid factory" do
    FactoryGirl.create(:play).should be_valid
  end
  
  it "has a valid description" do
    play_type = FactoryGirl.create(:play_type, description: "É Gol!")
    play = FactoryGirl.build(:play, play_type: play_type, involved: "Juninho Paraíba,Raí")
    play.description.should eq("É Gol!")

    play_type = FactoryGirl.create(:play_type, description: "É Gol! {0}, com passe de {1} e assistência de {2}!")
    play = FactoryGirl.create(:play, play_type: play_type, involved: "Juninho Paraíba,Raí,Denílson")
    play.description.should eq("É Gol! Juninho Paraíba, com passe de Raí e assistência de Denílson!")
  end
end
require 'spec_helper'

describe PlayType do
  it "has a valid factory" do
    FactoryGirl.create(:play_type).should be_valid
  end
end

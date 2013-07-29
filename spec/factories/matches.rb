FactoryGirl.define do
  factory :match do
    date Date.today
    home_team_id 1
    away_team_id 2
  end
end

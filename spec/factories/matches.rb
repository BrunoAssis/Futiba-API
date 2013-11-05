user_a = User.create(name: "Coach A", email: "coacha@test.com", password: "12345678")
user_b = User.create(name: "Coach B", email: "coachb@test.com", password: "12345678")

FactoryGirl.define do
  factory :match do
    date Date.today
    home_team Team.create(name: "Testing Team A", user: user_a)
    away_team Team.create(name: "Testing Team B", user: user_b)
  end
end
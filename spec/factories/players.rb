require 'name_generator'

FactoryGirl.define do
  factory :player do
    name NameGenerator.random_name
    number Random.rand(1..11)
    position ["G", "D", "M", "O"].sample
    offense Random.rand(0..10)
    defense Random.rand(0..10)
    stamina Random.rand(0..10)
    association :real_team
  end
end

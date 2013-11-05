require 'faker'

FactoryGirl.define do
  factory :team do
    name Faker::Name.name
    coat_of_arms "MyString.jpg"
    money 1000
    association :user
  end
end

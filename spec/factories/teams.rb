require 'faker'

FactoryGirl.define do
  factory :team do
    name Faker::Name.name
    user_id 1
    coat_of_arms "MyString.jpg"
    money 1000
  end
end

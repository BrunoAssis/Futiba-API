FactoryGirl.define do
  sequence(:name) {|n| "Name #{n}"}

  factory :team do
    name
    coat_of_arms "MyString.jpg"
    money 1000
    user
  end
end
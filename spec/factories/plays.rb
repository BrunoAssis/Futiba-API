# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :play do
    match
    period "1"
    minute 35
    play_type
    involved "Juninho Paraíba"
  end
end

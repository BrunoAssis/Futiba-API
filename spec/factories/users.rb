FactoryGirl.define do
  sequence(:email) {|n| "email_#{n}@provider.com"}
  sequence(:password) {|n| "password_#{n}"}

  factory :user do
    email
    password
  end
end
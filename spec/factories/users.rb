# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password "123456"
    password_confirmation "123456"
    dob "1977-09-19"
  end
end

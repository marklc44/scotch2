# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :whisky do
    name Faker::Lorem.word
    price 1
    age 1
    year 1
    rating 1
  end
end

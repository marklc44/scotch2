# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :producer do
    name Faker::Lorem.word
    url Faker::Internet.http_url
    image_url Faker::Internet.http_url
    wa_brand_id "90"
    semantics3_id "90"
  end
end

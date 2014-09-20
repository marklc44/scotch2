# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :flavor_profile do
    body 1
    sweetness 1
    smoky 1
    medicinal 1
    tobacco 1
    honey 1
    spicy 1
    winey 1
    nutty 1
    malty 1
    fruity 1
    floral 1
    broad_keyword1 "MyString"
    broad_keyword2 "MyString"
  end
end

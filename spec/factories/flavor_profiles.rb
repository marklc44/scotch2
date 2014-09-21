# Read about factories at https://github.com/thoughtbot/factory_girl

KEYWORDS = ["smoky", "light", "delicate", "rich"]

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
    broad_keyword1 KEYWORDS.sample
    broad_keyword2 KEYWORDS.sample

    association :flavored, :factory => :whisky
  end

end

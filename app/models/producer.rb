class Producer < ActiveRecord::Base
  belongs_to :region
  has_many :whiskies
  has_many :fav_producers
  has_one :flavor_profile, as: :flavored
end

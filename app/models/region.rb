class Region < ActiveRecord::Base
  has_many :producers
  has_one :flavor_profile, as: :flavored
end

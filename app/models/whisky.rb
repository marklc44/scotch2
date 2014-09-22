class Whisky < ActiveRecord::Base
  belongs_to :producer
  belongs_to :region
  has_one :flavor_profile, as: :flavored
end

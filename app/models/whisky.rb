class Whisky < ActiveRecord::Base
  belongs_to :producer
  has_one :flavor_profile, as: :flavored
end

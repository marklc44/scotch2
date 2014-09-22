class Region < ActiveRecord::Base
  has_many :producers
  has_many :whiskies
  has_one :flavor_profile, as: :flavored

  validates_presence_of :name
end

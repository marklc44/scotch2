class FlavorProfile < ActiveRecord::Base
  belongs_to :flavored, polymorphic: true

  validates_inclusion_of :broad_keyword1, :in => ["smoky", "light", "delicate", "rich"], allow_nil: true
  validates_inclusion_of :broad_keyword2, :in => ["smoky", "light", "delicate", "rich"], allow_nil: true

end

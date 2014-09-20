class FlavorProfile < ActiveRecord::Base
  belongs_to :flavored, polymorhpic: true
end

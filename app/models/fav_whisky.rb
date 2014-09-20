class FavWhisky < ActiveRecord::Base
  belongs_to :user
  belongs_to :whisky
end

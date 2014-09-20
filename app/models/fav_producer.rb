class FavProducer < ActiveRecord::Base
  belongs_to :user
  belongs_to :producer
end

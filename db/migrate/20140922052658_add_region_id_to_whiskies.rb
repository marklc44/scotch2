class AddRegionIdToWhiskies < ActiveRecord::Migration
  def change
    add_reference :whiskies, :region, index: true
  end
end

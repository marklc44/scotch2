class CreateFavWhiskies < ActiveRecord::Migration
  def change
    create_table :fav_whiskies do |t|
      t.references :user
      t.references :whisky

      t.timestamps
    end
  end
end

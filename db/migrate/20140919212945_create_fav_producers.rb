class CreateFavProducers < ActiveRecord::Migration
  def change
    create_table :fav_producers do |t|
      t.references :user
      t.references :producer

      t.timestamps
    end
  end
end

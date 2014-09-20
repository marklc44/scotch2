class CreateWhiskies < ActiveRecord::Migration
  def change
    create_table :whiskies do |t|
      t.string :name
      t.integer :price
      t.integer :age
      t.integer :year
      t.integer :rating
      t.references :producer

      t.timestamps
    end
  end
end

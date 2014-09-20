class CreateFlavorProfiles < ActiveRecord::Migration
  def change
    create_table :flavor_profiles do |t|
      t.integer :body
      t.integer :sweetness
      t.integer :smoky
      t.integer :medicinal
      t.integer :tobacco
      t.integer :honey
      t.integer :spicy
      t.integer :winey
      t.integer :nutty
      t.integer :malty
      t.integer :fruity
      t.integer :floral
      t.string :broad_keyword1
      t.string :broad_keyword2



      t.timestamps
    end
  end
end

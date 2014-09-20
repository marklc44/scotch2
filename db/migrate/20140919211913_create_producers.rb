class CreateProducers < ActiveRecord::Migration
  def change
    create_table :producers do |t|
      t.string :name
      t.text :url
      t.text :image_url
      t.string :wa_brand_id
      t.string :semantics3_id
      t.references :region

      t.timestamps
    end
  end
end

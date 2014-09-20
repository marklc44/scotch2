class AddPolymorphicToFlavorProfiles < ActiveRecord::Migration
  def change
    add_column :flavor_profiles, :flavored_id, :integer
    add_column :flavor_profiles, :flavored_type, :string
  end
end

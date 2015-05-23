class AddLanLatToManufacturer < ActiveRecord::Migration
  def change
    add_column :manufacturers, :lat, :string
    add_column :manufacturers, :lng, :string
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.integer :manufacturer_id
      t.string :name
      t.string :material
      t.integer :volume
      t.integer :width
      t.integer :height
      t.integer :depth
      t.integer :color
      t.integer :cost
      t.text :description
      t.string :slug

      t.timestamps null: false
    end
  end
end

class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :name
      t.attachment :image
      t.string :site
      t.string :address
      t.string :phone

      t.timestamps null: false
    end
  end
end

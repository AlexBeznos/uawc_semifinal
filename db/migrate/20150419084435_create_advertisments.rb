class CreateAdvertisments < ActiveRecord::Migration
  def change
    create_table :advertisments do |t|
      t.integer :kind
      t.attachment :image
      t.attachment :background_image
      t.string :title
      t.string :body
      t.string :price

      t.timestamps null: false
    end
  end
end

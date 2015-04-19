class AddFieldsToAdvertisment < ActiveRecord::Migration
  def change
    add_column :advertisments, :title_position, :integer
    add_column :advertisments, :line_color, :integer
  end
end

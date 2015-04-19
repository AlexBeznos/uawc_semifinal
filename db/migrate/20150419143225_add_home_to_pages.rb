class AddHomeToPages < ActiveRecord::Migration
  def change
    add_column :pages, :reserved_for, :integer
  end
end

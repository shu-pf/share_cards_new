class AddClumsToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :title, :string
    add_column :cards, :auther_name, :string
    add_column :cards, :qr_position_x, :integer
    add_column :cards, :qr_position_y, :integer
    add_column :cards, :serial_position_x, :integer
    add_column :cards, :serial_position_y, :integer
  end
end

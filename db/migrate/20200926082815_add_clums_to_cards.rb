class AddClumsToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :title, :string
    add_column :cards, :auther_name, :string
  end
end

class AddEdgeBlankToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :edge_blank, :boolean, null: false
  end
end

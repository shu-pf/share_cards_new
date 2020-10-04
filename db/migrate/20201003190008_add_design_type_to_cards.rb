class AddDesignTypeToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :design_type, :integer, null: false
  end
end

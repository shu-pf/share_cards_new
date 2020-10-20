class AddCreatorColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :creator, :boolean
  end
end

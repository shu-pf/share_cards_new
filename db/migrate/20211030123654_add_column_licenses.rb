class AddColumnLicenses < ActiveRecord::Migration[6.0]
  def up
    add_column :licenses, :download_times, :integer, default: 0
  end

  def down
    remove_column :licenses, :download_times, :integer
  end
end

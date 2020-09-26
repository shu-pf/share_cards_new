class CreateLicenses < ActiveRecord::Migration[6.0]
  def change
    create_table :licenses do |t|
      t.integer :license_group_id
      t.integer :user_id
      t.string :serial_code
      t.timestamps
    end
  end
end

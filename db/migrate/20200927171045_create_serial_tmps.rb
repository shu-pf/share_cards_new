class CreateSerialTmps < ActiveRecord::Migration[6.0]
  def change
    create_table :serial_tmps do |t|
      t.string :serial_code1
      t.string :serial_code2
      t.string :serial_code3
      t.string :serial_code4

      t.timestamps
    end
  end
end

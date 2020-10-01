class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.integer :card_id, null: false
      t.timestamps
    end
  end
end

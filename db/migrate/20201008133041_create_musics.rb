class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.integer :card_id, null: false
      t.string :title, null: false
      t.string :artist_name
      t.integer :track_number, null: false

      t.timestamps
    end
  end
end

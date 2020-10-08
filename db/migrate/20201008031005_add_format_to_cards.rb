class AddFormatToCards < ActiveRecord::Migration[6.0]
  def change
    add_column :cards, :format, :string, null: false
  end
end

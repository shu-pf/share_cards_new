class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :title, null: false
      t.string :email, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end

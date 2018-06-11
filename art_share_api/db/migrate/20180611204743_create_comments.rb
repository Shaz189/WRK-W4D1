class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :artist_id, null: false
      t.integer :artwork_id, null: false
      t.string :text, null: false
    end
  end
end

class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string "name", null: false
      t.string "email", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: falseb
    end
  end
end

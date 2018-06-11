class ChangeComment < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :artist_id, :author_id
  end
end

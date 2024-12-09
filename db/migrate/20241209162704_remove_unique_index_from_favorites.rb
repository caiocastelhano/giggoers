class RemoveUniqueIndexFromFavorites < ActiveRecord::Migration[7.1]
  def change
    remove_index :favorites, name: "index_favorites_on_user_id_and_event_id"
  end
end

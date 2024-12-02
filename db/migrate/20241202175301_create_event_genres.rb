class CreateEventGenres < ActiveRecord::Migration[7.1]
  def change
    create_table :event_genres do |t|
      t.integer :event_id
      t.integer :genre_id

      t.timestamps
    end
  end
end

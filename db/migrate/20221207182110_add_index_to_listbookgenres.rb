class AddIndexToListbookgenres < ActiveRecord::Migration[7.0]
  def change
    add_index :listbookgenres, %i[book_id genre_id], unique: true
  end
end

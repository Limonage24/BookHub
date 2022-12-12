class AddIndexToListbookauthors < ActiveRecord::Migration[7.0]
  def change
    add_index :listbookauthors, %i[book_id author_id], unique: true
  end
end

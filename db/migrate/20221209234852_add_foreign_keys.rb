class AddForeignKeys < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :comments, :books
    add_foreign_key :comments, :comments, column: :reply_to_id
    add_foreign_key :comments, :users
    add_foreign_key :listbookauthors, :authors
    add_foreign_key :listbookauthors, :books
    add_foreign_key :listbookgenres, :books
    add_foreign_key :listbookgenres, :genres
    add_foreign_key :listuserlikedbooks, :books
    add_foreign_key :listuserlikedbooks, :users
    add_foreign_key :listuserreadbooks, :books
    add_foreign_key :listuserreadbooks, :users
  end
end

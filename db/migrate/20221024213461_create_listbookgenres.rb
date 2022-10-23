class CreateListbookgenres < ActiveRecord::Migration[7.0]
  def change
    create_table :listbookgenres do |t|
      t.bigint :book_id
      t.bigint :genre_id
    end
  end
end

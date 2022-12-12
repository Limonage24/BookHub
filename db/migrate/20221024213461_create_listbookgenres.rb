class CreateListbookgenres < ActiveRecord::Migration[7.0]
  def change
    create_table :listbookgenres do |t|
      t.bigint :book_id, null: false
      t.bigint :genre_id, null: false
    end
  end
end

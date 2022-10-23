class CreateListbookauthors < ActiveRecord::Migration[7.0]
  def change
    create_table :listbookauthors do |t|
      t.bigint :book_id
      t.bigint :author_id
    end
  end
end

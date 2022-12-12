class CreateListuserreadbooks < ActiveRecord::Migration[7.0]
  def change
    create_table :listuserreadbooks do |t|
      t.bigint :book_id, null: false
      t.bigint :user_id, null: false
      t.timestamp :created_at, null: false
    end
  end
end

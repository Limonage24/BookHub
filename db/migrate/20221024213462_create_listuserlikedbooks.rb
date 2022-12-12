class CreateListuserlikedbooks < ActiveRecord::Migration[7.0]
  def change
    create_table :listuserlikedbooks do |t|
      t.bigint :book_id, null: false
      t.bigint :user_id, null: false
    end
  end
end

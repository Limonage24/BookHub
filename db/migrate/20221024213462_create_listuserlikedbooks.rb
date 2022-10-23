class CreateListuserlikedbooks < ActiveRecord::Migration[7.0]
  def change
    create_table :listuserlikedbooks do |t|
      t.bigint :book_id
      t.bigint :user_id
    end
  end
end

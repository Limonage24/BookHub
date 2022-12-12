class AddIndexToListuserlikedbooks < ActiveRecord::Migration[7.0]
  def change
    add_index :listuserlikedbooks, %i[book_id user_id], unique: true
  end
end

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :user_id
      t.bigint :book_id
      t.bigint :reply_to
      t.text :content

      t.timestamps
    end
  end
end

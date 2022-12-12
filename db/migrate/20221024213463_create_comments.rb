class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :user_id
      t.bigint :book_id, null: false
      t.bigint :reply_to_id
      t.text :content, null: false
      t.boolean :deleted, null: false

      t.timestamps
    end
  end
end

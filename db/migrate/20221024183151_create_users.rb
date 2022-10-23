class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.text :description
      t.string :role
      t.text :avatar

    end
  end
end

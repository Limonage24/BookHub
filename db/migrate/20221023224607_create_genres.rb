class CreateGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :genres do |t|
      t.bigint :id_genre
      t.string :name

      t.timestamps
    end
  end
end

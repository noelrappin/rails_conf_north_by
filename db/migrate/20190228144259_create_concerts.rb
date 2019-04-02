class CreateConcerts < ActiveRecord::Migration[6.0]
  def change
    create_table :concerts do |t|
      t.string :name
      t.text :description
      t.datetime :start_time
      t.references :venue, foreign_key: true
      t.text :genre_tags
      t.integer :ilk
      t.integer :access

      t.timestamps
    end
  end
end

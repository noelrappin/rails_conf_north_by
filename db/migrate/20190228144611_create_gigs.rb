class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.references :band, foreign_key: true
      t.references :concert, foreign_key: true
      t.integer :order
      t.integer :duration_minutes

      t.timestamps
    end
  end
end

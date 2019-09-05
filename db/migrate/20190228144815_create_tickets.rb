class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :concert, foreign_key: true
      t.integer :row
      t.integer :number
      t.references :user

      t.timestamps
    end
  end
end

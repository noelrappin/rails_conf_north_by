class UpdateTicket < ActiveRecord::Migration[6.0]
  def change
    change_table :tickets do |t|
      t.integer :status
    end
  end
end

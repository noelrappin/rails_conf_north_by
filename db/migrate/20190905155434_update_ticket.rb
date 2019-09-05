class UpdateTicket < ActiveRecord::Migration[6.0]
  def change
    rename_column :tickets, :gig_id, :concert_id
    rename_column :ticket_orders, :gig_id, :concert_id
    change_table :tickets do |t|
      t.integer :status
    end
  end
end

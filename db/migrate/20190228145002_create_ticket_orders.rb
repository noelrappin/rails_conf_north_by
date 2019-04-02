class CreateTicketOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :ticket_orders do |t|
      t.references :gig, foreign_key: true

      t.timestamps
    end

    change_table :tickets do |t|
      t.references :ticket_orders
    end
  end
end

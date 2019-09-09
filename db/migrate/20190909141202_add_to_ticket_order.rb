class AddToTicketOrder < ActiveRecord::Migration[6.0]
  def change
    change_table :ticket_orders do |t|
      t.integer :status, default: 0
      t.integer :count, default: 0
      t.integer :shopping_cart_id
    end
  end
end

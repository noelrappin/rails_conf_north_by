# == Schema Information
#
# Table name: ticket_orders
#
#  id               :integer          not null, primary key
#  concert_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  status           :integer          default(0)
#  count            :integer          default(0)
#  shopping_cart_id :integer
#
class TicketOrder < ApplicationRecord
  belongs_to :concert
  belongs_to :shopping_cart
  has_many :tickets
end

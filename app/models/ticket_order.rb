# == Schema Information
#
# Table name: ticket_orders
#
#  id         :integer          not null, primary key
#  concert_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TicketOrder < ApplicationRecord
  belongs_to :concert
end

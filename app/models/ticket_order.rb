# == Schema Information
#
# Table name: ticket_orders
#
#  id         :bigint(8)        not null, primary key
#  gig_id     :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TicketOrder < ApplicationRecord
  belongs_to :gig
end

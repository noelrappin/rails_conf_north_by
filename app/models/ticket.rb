# == Schema Information
#
# Table name: tickets
#
#  id               :bigint(8)        not null, primary key
#  gig_id           :bigint(8)
#  row              :integer
#  number           :integer
#  user_id          :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  ticket_orders_id :bigint(8)
#

class Ticket < ApplicationRecord
  belongs_to :gig
  belongs_to :user
end

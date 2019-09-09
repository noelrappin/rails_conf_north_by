# == Schema Information
#
# Table name: tickets
#
#  id              :integer          not null, primary key
#  concert_id      :integer
#  row             :integer
#  number          :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  ticket_order_id :integer
#  status          :integer
#

class Ticket < ApplicationRecord
  belongs_to :concert
  belongs_to :user, optional: true
  belongs_to :ticket_order

  enum status: %i[unsold held purchased refunded]
end

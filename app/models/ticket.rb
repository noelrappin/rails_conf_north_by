# == Schema Information
#
# Table name: tickets
#
#  id               :integer          not null, primary key
#  concert_id       :integer
#  row              :integer
#  number           :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  ticket_orders_id :integer
#  status           :integer
#

class Ticket < ApplicationRecord
  belongs_to :concert
  belongs_to :user

  enum status: %i[:open, :held, :purchased, :refunded]
end

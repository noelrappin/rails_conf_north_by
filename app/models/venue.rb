# == Schema Information
#
# Table name: venues
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  description   :text
#  rows          :integer
#  seats_per_row :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Venue < ApplicationRecord
end

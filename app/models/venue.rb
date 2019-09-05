# == Schema Information
#
# Table name: venues
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  rows          :integer
#  seats_per_row :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Venue < ApplicationRecord
end

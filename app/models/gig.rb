# == Schema Information
#
# Table name: gigs
#
#  id               :bigint(8)        not null, primary key
#  band_id          :bigint(8)
#  concert_id       :bigint(8)
#  order            :integer
#  duration_minutes :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Gig < ApplicationRecord
  belongs_to :band
  belongs_to :concert
end

# == Schema Information
#
# Table name: gigs
#
#  id               :integer          not null, primary key
#  band_id          :integer
#  concert_id       :integer
#  order            :integer
#  duration_minutes :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Gig < ApplicationRecord
  belongs_to :band
  belongs_to :concert
end

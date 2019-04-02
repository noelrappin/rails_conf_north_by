# == Schema Information
#
# Table name: concerts
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  start_time  :datetime
#  venue_id    :bigint(8)
#  genre_tags  :text
#  ilk         :integer
#  access      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Concert < ApplicationRecord
  belongs_to :venue
  has_many :gigs, -> { order(order: :asc) }, dependent: :destroy
  has_many :bands, through: :gigs

  enum ilk: %i[concert meet-n-greet battle]
  enum access: %i[general members vips]

  def start_day
    start_time.to_date
  end

  def duration_minutes
    gigs.map(&:duration_minutes).sum
  end

  def genre_parameters
    genre_tags.split(",").map(&:parameterize).join(",")
  end
end

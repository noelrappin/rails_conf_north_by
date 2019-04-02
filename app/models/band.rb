# == Schema Information
#
# Table name: bands
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  description :text
#  genre_tags  :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Band < ApplicationRecord
  has_many :gigs, dependent: :destroy
  has_many :concerts, through: :gigs

  def genres
    genre_tags.split(",")
  end
end

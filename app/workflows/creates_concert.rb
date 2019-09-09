class CreatesConcert

  attr_reader :params, :concert

  def initialize(params)
    @params = params
  end

  def run
    Concert.transaction do
      @concert = Concert.create!(params)
      concert.venue.rows.times do |row_number|
      concert.venue.seats_per_row.times do |seat_number|
        concert.tickets.create!(
            row: row_number + 1,
            number: seat_number + 1,
            status: "unsold")
      end
    end
    end
  end

end

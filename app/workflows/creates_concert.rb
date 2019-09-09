class CreatesConcert

  attr_reader :params, :concert

  def initialize(params)
    @params = params
  end

  def run
    Concert.transaction do
      @concert = Concert.create!(params)
      concert.venue.total_seats.times do
        concert.tickets.create!(status: :unsold)
      end
    end
  end

end

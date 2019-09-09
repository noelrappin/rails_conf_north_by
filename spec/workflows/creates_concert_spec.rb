require "rails_helper"

RSpec.describe CreatesConcert do

  let!(:venue) { Venue.create(name: "House", rows: 5, seats_per_row: 10) }

  it "creates tickets when a concert is created" do
    params = {name: "A concert", description: "Fun",
              start_time: 1.month.from_now, venue_id: venue.id}
    creator = CreatesConcert.new(params)
    creator.run
    expect(creator.concert.unsold_ticket_count).to eq(50)
    expect(creator.concert.purchased_ticket_count).to eq(0)
  end

end

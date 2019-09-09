require "rails_helper"

RSpec.describe "adding a concert and tickets" do

  let!(:venue) { Venue.create(name: "House", rows: 5, seats_per_row: 10) }

  it "creates tickets when a concert is created" do
    visit(new_concert_path)
    fill_in("Name", with: "A Cool Concert")
    select("House", from: "Venue")
    click_on("Create Concert")
    visit(concerts_path)
    new_concert = Concert.last
    within("#concert_#{new_concert.id}") do
      expect(page).to have_selector(".unsold_ticket_count", text: 50)
    end
  end

end

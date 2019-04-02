GENRES = [
  "Acid Rock",
  "Adult Alternative",
  "Adult Contemporary",
  "Adult-Oriented Rock",
  "Afro Punk",
  "Alternative Rock",
  "Alternative Rock",
  "American Trad Rock",
  "Anatolian Rock",
  "Arena Rock",
  "Art Punk",
  "Art Rock",
  "Blues-Rock",
  "British Invasion",
  "Britpop",
  "Bubblegum Pop",
  "Chamber Pop",
  "Cock Rock",
  "College Rock",
  "Crossover Thrash",
  "Crust Punk",
  "Dance Pop",
  "Death Metal",
  "Doom Metal",
  "Dream Pop",
  "Electro Pop",
  "Experimental Rock",
  "Folk Punk",
  "Glam Rock",
  "Goth",
  "Gothic Metal",
  "Grind Core",
  "Grunge",
  "Hair Metal",
  "Hard Rock",
  "Hard Rock",
  "Hardcore Punk",
  "Indie Rock",
  "Jam Bands",
  "Lo-fi",
  "Math Metal",
  "Math Rock",
  "Metal",
  "Metal Core",
  "New Wave",
  "Noise Rock",
  "Orchestral Pop",
  "Pop Punk",
  "Pop/Rock",
  "Post Punk",
  "Power Pop",
  "Prog-Roc",
  "Progressive Metal",
  "Progressive Rock",
  "Psychedelic",
  "Punk",
  "Rock & Roll",
  "Rockabilly",
  "Roots Rock",
  "Shoegaze",
  "Singer/Songwriter",
  "Soft Rock",
  "Southern Rock",
  "Spazzcore",
  "Steampunk",
  "Stoner Metal",
  "Surf",
  "Synthpop",
  "Technical Death Metal",
  "Teen Pop",
  "Tex-Mex",
  "Time Lord Rock",
  "Trash Metal",
].freeze

ActiveRecord::Base.transaction do
  Gig.delete_all
  Concert.delete_all
  Band.delete_all
  Venue.delete_all

  venues = Array.new(10).map {
    Venue.create!(name: Faker::University.name,
                  rows: [20, 25, 30, 25, 40, 45, 50].sample,
                  seats_per_row: [10, 15, 20, 25].sample)
  }

  bands = Array.new(100).map {
    Band.create!(
      name: Faker::Music::RockBand.name,
      description: Faker::Lorem.sentence(2),
      genre_tags: GENRES.sample((1..5).to_a.sample).join(",")
    )
  }

  start_date = 30.days.from_now.beginning_of_day
  end_date = 40.days.from_now.beginning_of_day

  days = (start_date.to_date..end_date.to_date).to_a
  hours = [13, 15, 17, 19, 21]

  ilk = %w[concert concert concert meet-n-greet battle]

  access = %w[general general general general members vips]

  Array.new(200).each do
    date = days.sample
    concert = Concert.create!(
      description: Faker::Lorem.sentence(2),
      start_time: date + hours.sample.hours,
      venue: venues.sample,
      ilk: ilk.sample,
      access: access.sample
    )
    [1, 1, 1, 2, 2, 3].sample.times do |i|
      concert.gigs.create(
        band: bands.sample, order: i,
        duration_minutes: [30, 60, 60, 60, 90].sample
      )
    end
    concert.update(
      genre_tags: concert.bands.flat_map(&:genres).uniq.join(","),
      name: Faker::Book.title
    )
  end
end

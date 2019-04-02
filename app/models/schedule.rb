class Schedule
  attr_accessor :schedule_days

  def self.from_concerts(all_concerts)
    schedule = Schedule.new
    all_concerts.group_by(&:start_day).each do |day, concerts|
      schedule.schedule_days << ScheduleDay.new(day, concerts)
      schedule.schedule_days.sort_by!(&:day)
    end
    schedule
  end

  def initialize
    @schedule_days = []
  end
end

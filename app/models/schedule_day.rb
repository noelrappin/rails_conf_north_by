class ScheduleDay
  attr_accessor :day, :concerts

  def initialize(day, concerts)
    @day = day
    @concerts = concerts
  end
end

class SchedulesController < ApplicationController
  def show
    @concerts = Concert.includes(:venue, gigs: :band).all
    @schedule = Schedule.from_concerts(@concerts)
    respond_to do |format|
      format.html
      format.json { render json: @concerts }
    end
  end
end

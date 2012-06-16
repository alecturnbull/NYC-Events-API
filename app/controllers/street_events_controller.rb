class StreetEventsController < ApplicationController

def search
  start_date = Chronic.parse(params[:start_date])
  end_date = Chronic.parse(params[:end_date])
  lat = params[:lat]
  lng = params[:lng]


  if params[:start_date] and params[:end_date] and params[:borough]
    borough = params[:borough].capitalize
    @events = StreetEvent.where("start_date <= ? AND end_date >= ? AND borough = ?", start_date, end_date, borough)
  elsif params[:start_date] and params[:end_date] and not params[:borough]
    @events = StreetEvent.where("start_date <= ? AND end_date >= ?", start_date, end_date)
  elsif params[:start_date] and not params[:end_date] and not params[:borough]
    @events = StreetEvent.where("start_date <= ?", start_date)
  elsif not params[:start_date] and params[:end_date] and not params[:borough]
    @events = StreetEvent.where("end_date >= ?", end_date)    
  elsif not params[:start_date] and not params[:end_date] and params[:borough]
    borough = params[:borough].capitalize
    @events = StreetEvent.where("borough = ?", borough)
  else
    @events = StreetEvent.all
  end

  @events_json = []
  @events.each do |event|
    parsed_event = {
      :name => event.name,
      :address => event.address.squeeze(" "),
      :start_date => event.start_date.strftime("%l:%M%p on %B %d, %Y"),
      :end_date => event.end_date.strftime("%l:%M%P on %B %d, %Y"),
      :description => "A New York City street event.",
      :category => event.event_type,
      :borough => event.borough
    }
    @events_json << parsed_event
  end
  respond_to do |format|
    format.json { render :json => @events_json }
  end
end




end

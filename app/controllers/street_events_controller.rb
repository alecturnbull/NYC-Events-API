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
  respond_to do |format|
    format.json { render :json => @events }
  end
end




end

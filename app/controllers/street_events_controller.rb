class StreetEventsController < ApplicationController

def search
  start_date = Chronic.parse(params[:start_date])
  end_date = Chronic.parse(params[:end_date])
  if start_date.nil? && end_date.nil?
    @events = StreetEvent.all
  else
    @events = StreetEvent.where("start <= ? AND end >= ?", start_date, end_date)
  end
  respond_to do |format|
    format.json { render :json => @events }
  end
end




end

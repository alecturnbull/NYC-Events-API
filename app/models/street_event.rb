class StreetEvent < ActiveRecord::Base
  attr_accessible :address, :borough, :end_date, :event_type, :name, :start_date
end

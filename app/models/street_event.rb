class StreetEvent < ActiveRecord::Base
  attr_accessible :address, :borough, :end, :name, :start, :event_type
end

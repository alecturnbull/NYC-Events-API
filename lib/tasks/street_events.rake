require 'open-uri'

STREET_DATASET_URL = "http://nycopendata.socrata.com/api/views/xenu-5qjw/rows.json"

namespace :street_data do
  desc "Pull in Data from NYC Street Events Dataset"
  task :refresh => :environment do
    # puts "Deleting old events..."
    # StreetEvent.delete_all
    response = URI.parse(STREET_DATASET_URL)
    parsed_response = ActiveSupport::JSON.decode(response.read)

    parsed_response["data"].each do |info|
      event = StreetEvent.new
      event.name = info[8]
      event.event_type = info[9]
      event.start_date = Chronic.parse(info[12])
      event.end_date = Chronic.parse(info[13])
      event.address = info[18]
      event.borough = info[19]
      event.save
    end


  end
end




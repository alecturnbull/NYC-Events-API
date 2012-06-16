class AddIndicesToStreetEvents < ActiveRecord::Migration
  def change
    add_index :street_events, :event_type
    add_index :street_events, :start_date
    add_index :street_events, :end_date
    add_index :street_events, :borough
  end
end

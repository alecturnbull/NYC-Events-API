class AddIndicesToStreetEvents < ActiveRecord::Migration
  def change
    add_index :street_events, :event_type
    add_index :street_events, :start
    add_index :street_events, :end
    add_index :street_events, :borough
  end
end

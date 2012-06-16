class CreateStreetEvents < ActiveRecord::Migration
  def change
    create_table :street_events do |t|
      t.text :address
      t.text :borough
      t.datetime :end_date
      t.text :name
      t.datetime :start_date
      t.text :event_type

      t.timestamps
    end
    add_index :street_events, :event_type
    add_index :street_events, :start_date
    add_index :street_events, :end_date
    add_index :street_events, :borough
  end
end

class CreateStreetEvents < ActiveRecord::Migration
  def change
    create_table :street_events do |t|
      t.text :name
      t.text :event_type
      t.datetime :start_date
      t.datetime :end_date
      t.text :address
      t.text :borough

      t.timestamps

    end
  end
end

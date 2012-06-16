class CreateStreetEvents < ActiveRecord::Migration
  def change
    create_table :street_events do |t|
      t.text :name
      t.text :event_type
      t.datetime :start
      t.datetime :end
      t.text :address
      t.text :borough

      t.timestamps

    end
  end
end

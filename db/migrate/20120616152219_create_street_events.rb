class CreateStreetEvents < ActiveRecord::Migration
  def change
    create_table :street_events do |t|
      t.text :name
      t.string :event_type
      t.datetime :start
      t.datetime :end
      t.text :address
      t.string :borough

      t.timestamps

    end
  end
end

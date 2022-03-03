class CreateTripAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_availabilities do |t|
      t.references :trip
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end

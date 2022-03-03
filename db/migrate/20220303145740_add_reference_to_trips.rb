class AddReferenceToTrips < ActiveRecord::Migration[6.1]
  def change
    add_reference :trips, :trip_availability, foreign_key: true
  end
end

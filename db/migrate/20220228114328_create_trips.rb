class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :place
      t.date :start_at
      t.date :end_at
      t.integer :duration
      t.boolean :subscription_lock, default: false

      t.timestamps
    end
  end
end

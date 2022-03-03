class CreateAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :availabilities do |t|
      t.string :available
      t.references :user, null: false, foreign_key: true
      t.references :trip_availability, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.references :place_proposal
      t.references :user
      t.string :name
      t.date :start_at
      t.date :end_at
      t.integer :duration
      t.string :status, default: "created"

      t.timestamps
    end
  end
end

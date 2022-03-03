class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.references :place_proposal
      t.references :user
      t.integer :month
      t.string :name
      t.string :time_span
      t.string :status, default: "created"

      t.timestamps
    end
  end
end

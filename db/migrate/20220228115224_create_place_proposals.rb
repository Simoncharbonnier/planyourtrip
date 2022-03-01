class CreatePlaceProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :place_proposals do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :place, null: false, foreign_key: true
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end

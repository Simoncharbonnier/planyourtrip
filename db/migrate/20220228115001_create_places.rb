class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :city
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end

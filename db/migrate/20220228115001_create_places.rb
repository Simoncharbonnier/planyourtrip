class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :city
      t.string :country
      t.string :pint_cost
      t.string :temperature
      t.string :plane_cost
      t.string :lodging_cost
      t.timestamps
    end
  end
end

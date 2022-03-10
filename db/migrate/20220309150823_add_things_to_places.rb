class AddThingsToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :country, :string
    add_column :places, :pint_cost, :string
    add_column :places, :temperature, :string
    add_column :places, :plane_cost, :string
    add_column :places, :lodging_cost, :string
  end
end

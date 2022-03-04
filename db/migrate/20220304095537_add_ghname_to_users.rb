class AddGhnameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ghname, :string
  end
end

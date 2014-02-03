class AddLocationToGym < ActiveRecord::Migration
  def change
    add_column :gyms, :location, :string
  end
end

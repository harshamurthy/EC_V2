class AddClientIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :client_id, :integer
  end
end

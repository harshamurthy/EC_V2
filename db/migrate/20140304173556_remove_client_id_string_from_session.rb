class RemoveClientIdStringFromSession < ActiveRecord::Migration
  def change
    remove_column :sessions, :client_id_string
  end
end

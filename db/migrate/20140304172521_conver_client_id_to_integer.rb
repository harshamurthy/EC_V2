class ConverClientIdToInteger < ActiveRecord::Migration
  def up
    rename_column :sessions, :client_id, :client_id_string
    add_column :sessions, :client_id, :integer

    Session.all.each do |s|
      s.update client_id: s.client_id_string.to_i
    end
  end

  def down
    remove_column :sessions, :client_id
    rename_column :sessions, :client_id_string, :client_id
  end
end

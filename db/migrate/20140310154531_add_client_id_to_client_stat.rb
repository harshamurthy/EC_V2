class AddClientIdToClientStat < ActiveRecord::Migration
  def change
    add_column :client_stats, :client_id, :integer
  end
end

class AddClientIdToSettingExecution < ActiveRecord::Migration
  def change
    add_column :setting_executions, :client_id, :integer
  end
end

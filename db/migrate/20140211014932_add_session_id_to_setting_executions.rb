class AddSessionIdToSettingExecutions < ActiveRecord::Migration
  def change
    add_column :setting_executions, :session_id, :integer
  end
end

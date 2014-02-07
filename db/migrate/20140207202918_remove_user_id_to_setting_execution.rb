class RemoveUserIdToSettingExecution < ActiveRecord::Migration
  def change
    remove_column :setting_executions, :user_id
  end
end

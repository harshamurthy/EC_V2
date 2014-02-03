class RemoveRoutinesSessionsTable < ActiveRecord::Migration
  def change
    drop_table :routines_sessions
  end
end

class AddRoutineIdToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :routine_id, :integer
  end
end

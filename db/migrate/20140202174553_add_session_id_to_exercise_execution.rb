class AddSessionIdToExerciseExecution < ActiveRecord::Migration
  def change
    add_column :exercise_executions, :session_id, :integer
  end
end

class AddExerciseIdToExerciseExecution < ActiveRecord::Migration
  def change
    add_column :exercise_executions, :exercise_id, :integer
  end
end

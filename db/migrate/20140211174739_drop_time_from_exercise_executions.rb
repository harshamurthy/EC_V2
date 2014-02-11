class DropTimeFromExerciseExecutions < ActiveRecord::Migration
  def change
    remove_column :exercise_executions, :time
  end
end

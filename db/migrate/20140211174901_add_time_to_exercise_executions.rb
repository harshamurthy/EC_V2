class AddTimeToExerciseExecutions < ActiveRecord::Migration
  def change
    add_column :exercise_executions, :time, :time
  end
end

class AddColumnsToExerciseExecutions < ActiveRecord::Migration
  def change
    add_column :exercise_executions, :weight, :integer
    add_column :exercise_executions, :percentage, :integer
    add_column :exercise_executions, :reps, :integer
    add_column :exercise_executions, :time, :integer
  end
end

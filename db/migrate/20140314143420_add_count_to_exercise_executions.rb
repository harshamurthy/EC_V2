class AddCountToExerciseExecutions < ActiveRecord::Migration
  def change
    add_column :exercise_executions, :count, :integer
  end
end

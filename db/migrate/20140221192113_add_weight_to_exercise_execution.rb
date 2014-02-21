class AddWeightToExerciseExecution < ActiveRecord::Migration
  def change
    add_column :exercise_executions, :weight, :decimal
  end
end

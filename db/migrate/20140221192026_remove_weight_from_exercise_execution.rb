class RemoveWeightFromExerciseExecution < ActiveRecord::Migration
  def change
    remove_column :exercise_executions, :weight
  end
end

class AddTimeToExerciseEx < ActiveRecord::Migration
  def change
    add_column :exercise_executions, :time, :string
  end
end

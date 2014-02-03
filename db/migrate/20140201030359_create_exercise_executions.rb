class CreateExerciseExecutions < ActiveRecord::Migration
  def change
    create_table :exercise_executions do |t|
      t.string :weight
      t.string :percentage
      t.string :reps
      t.string :time
      t.string :seat
      t.string :foot
      t.string :degrees
      t.string :back

      t.timestamps
    end
  end
end

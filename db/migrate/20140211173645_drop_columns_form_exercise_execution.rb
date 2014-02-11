class DropColumnsFormExerciseExecution < ActiveRecord::Migration
  def change
    remove_column :exercise_executions, :weight
    remove_column :exercise_executions, :percentage
    remove_column :exercise_executions, :reps
    remove_column :exercise_executions, :time
    remove_column :exercise_executions, :seat
    remove_column :exercise_executions, :foot
    remove_column :exercise_executions, :degrees
    remove_column :exercise_executions, :back
    remove_column :exercise_executions, :foot_stool
    remove_column :exercise_executions, :pin
    remove_column :exercise_executions, :arm
    remove_column :exercise_executions, :seatbelt
    remove_column :exercise_executions, :backpad
    remove_column :exercise_executions, :knee
    remove_column :exercise_executions, :seatpad
    remove_column :exercise_executions, :chestpad
    remove_column :exercise_executions, :hips
    remove_column :exercise_executions, :leg
  end
end

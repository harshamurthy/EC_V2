class AddStuffToExerciseExecution < ActiveRecord::Migration
  def change
    add_column :exercise_executions, :foot_stool, :string
    add_column :exercise_executions, :pin, :string
    add_column :exercise_executions, :arm, :string
    add_column :exercise_executions, :seatbelt, :string
    add_column :exercise_executions, :backpad, :string
    add_column :exercise_executions, :knee, :string
    add_column :exercise_executions, :seatpad, :string
    add_column :exercise_executions, :chestpad, :string
    add_column :exercise_executions, :hips, :string
    add_column :exercise_executions, :leg, :string
  end
end

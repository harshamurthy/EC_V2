class AddTime < ActiveRecord::Migration
  def change
    add_column :exercise_executions, :time, :float
  end
end

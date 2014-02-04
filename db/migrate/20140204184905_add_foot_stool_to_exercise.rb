class AddFootStoolToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :foot_stool, :boolean, default: false
    add_column :exercises, :pin, :boolean, default: false
  end
end

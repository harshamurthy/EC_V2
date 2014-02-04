class AddMoreToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :arm, :boolean, default: false
    add_column :exercises, :seatbelt, :boolean, default: false
    add_column :exercises, :backpad, :boolean, default: false
    add_column :exercises, :knee, :boolean, default: false
    add_column :exercises, :seatpad, :boolean, default: false
    add_column :exercises, :chestpad, :boolean, default: false
    add_column :exercises, :hips, :boolean, default: false
  end
end

class AddLegToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :leg, :boolean, default: false
  end
end

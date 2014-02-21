class AddGymIdToExercise < ActiveRecord::Migration
  def change
    add_column :exercises, :gym_id, :integer
  end
end

class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.boolean :weight
      t.boolean :percentage
      t.boolean :reps
      t.boolean :time
      t.boolean :seat
      t.boolean :foot
      t.boolean :degrees
      t.boolean :back

      t.timestamps
    end
  end
end

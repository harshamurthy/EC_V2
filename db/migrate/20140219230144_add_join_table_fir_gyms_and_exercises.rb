class AddJoinTableFirGymsAndExercises < ActiveRecord::Migration
  def change
    create_table :exercises_gyms, :id => false do |t|
      t.references :exercise, :null => false
      t.references :gym, :null => false
    end
  end
end

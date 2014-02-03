class AddAnotherConnectingTable < ActiveRecord::Migration
  def change
    create_table :exercises_routines, :id => false do |t|
      t.references :exercise, :null => false
      t.references :routine, :null => false
    end
  end
end

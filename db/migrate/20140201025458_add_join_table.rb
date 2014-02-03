class AddJoinTable < ActiveRecord::Migration
  def change
    create_table :routines_sessions, :id => false do |t|
      t.references :routine, :null => false
      t.references :session, :null => false
    end
  end
end

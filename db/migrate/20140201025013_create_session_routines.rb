class CreateSessionRoutines < ActiveRecord::Migration
  def change
    create_table :session_routines do |t|
      t.integer :routine_id
      t.integer :session_id

      t.timestamps
    end
  end
end

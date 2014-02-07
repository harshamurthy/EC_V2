class CreateSettingExecutions < ActiveRecord::Migration
  def change
    create_table :setting_executions do |t|
      t.string :seat
      t.string :foot
      t.string :degrees
      t.string :back
      t.integer :user_id
      t.integer :exercise_id
      t.string :foot_stool
      t.string :pin
      t.string :arm
      t.string :seatbelt
      t.string :backpad
      t.string :knee
      t.string :seatpad
      t.string :chestpad
      t.string :hips
      t.string :leg

      t.timestamps
    end
  end
end

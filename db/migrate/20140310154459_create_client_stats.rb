class CreateClientStats < ActiveRecord::Migration
  def change
    create_table :client_stats do |t|
      t.float :weight
      t.float :skeletal_muscle_mass
      t.float :body_fat_mass
      t.float :percent_body_fat
      t.float :right_arm
      t.float :left_arm
      t.float :trunk
      t.float :right_leg
      t.float :left_leg
      t.integer :basal_metabolic_rate
      t.float :fat_to_lose
      t.float :muscle_to_gain

      t.timestamps
    end
  end
end

class CreateRoutines < ActiveRecord::Migration
  def change
    create_table :routines do |t|
      t.text :description
      t.integer :gym_id

      t.timestamps
    end
  end
end

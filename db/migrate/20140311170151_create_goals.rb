class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :content
      t.integer :client_id

      t.timestamps
    end
  end
end

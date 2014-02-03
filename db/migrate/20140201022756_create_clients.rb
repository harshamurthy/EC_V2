class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :gym_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :machine_code

      t.timestamps
    end
  end
end

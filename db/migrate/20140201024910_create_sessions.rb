class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :date
      t.string :client_id

      t.timestamps
    end
  end
end

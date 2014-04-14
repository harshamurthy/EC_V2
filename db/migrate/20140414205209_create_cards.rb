class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.date :date

      t.timestamps
    end
  end
end

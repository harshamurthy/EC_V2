class AddDateToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :date, :datetime
  end
end

class RemoveSessionDate < ActiveRecord::Migration
  def change
    remove_column :sessions, :date
  end
end

class AddFinishedAtToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :finished_at, :datetime
  end
end

class AddDoneToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :done, :boolean
  end
end

class AddDateToSessionsThing < ActiveRecord::Migration
  def change
    add_column :sessions, :date, :date
  end
end

class AddSessionTagToSession < ActiveRecord::Migration
  def change
    add_column :sessions, :session_tag, :string
  end
end

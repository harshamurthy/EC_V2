class AddCoachToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :coach, :string
  end
end

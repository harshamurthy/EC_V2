class AddCardIdToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :card_id, :integer
  end
end

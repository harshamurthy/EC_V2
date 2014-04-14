class AddClientIdToCard < ActiveRecord::Migration
  def change
    add_column :cards, :client_id, :integer
  end
end

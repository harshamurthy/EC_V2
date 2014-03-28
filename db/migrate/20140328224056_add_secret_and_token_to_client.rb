class AddSecretAndTokenToClient < ActiveRecord::Migration
  def change
    add_column :clients, :oauth_token, :string
    add_column :clients, :oauth_secret, :string
  end
end

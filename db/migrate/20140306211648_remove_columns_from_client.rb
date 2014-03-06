class RemoveColumnsFromClient < ActiveRecord::Migration
  def change
    remove_column :clients, :encrypted_password
    remove_column :clients, :reset_password_token
    remove_column :clients, :reset_password_sent_at
    remove_column :clients, :remember_created_at
    remove_column :clients, :sign_in_count
    remove_column :clients, :current_sign_in_at
    remove_column :clients, :last_sign_in_at
    remove_column :clients, :current_sign_in_ip
    remove_column :clients, :last_sign_in_ip
  end
end

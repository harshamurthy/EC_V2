class AddBirthdayAndGenderToClient < ActiveRecord::Migration
  def change
    add_column :clients, :gender, :string
    add_column :clients, :birthday, :date
  end
end

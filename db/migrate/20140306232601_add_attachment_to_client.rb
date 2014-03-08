class AddAttachmentToClient < ActiveRecord::Migration
  def change
    add_attachment :clients, :avatar
  end
end

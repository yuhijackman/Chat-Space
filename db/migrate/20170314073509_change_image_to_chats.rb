class ChangeImageToChats < ActiveRecord::Migration[5.0]
  def up
    change_column :Chats, :image, :string
  end

  def down
    change_column :Chats, :image, :text
  end
end

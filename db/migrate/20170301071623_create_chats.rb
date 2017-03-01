class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.string :body, null: false
      t.text :image
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.timestamps null: false
      t.timestamps
    end
  end
end

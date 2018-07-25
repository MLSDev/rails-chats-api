class CreateChatsUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :chats_users, id: false do |t|
      t.integer :chat_id

      t.integer :user_id
    end
  end
end

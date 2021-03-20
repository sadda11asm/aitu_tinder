class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :chat, index: true, foreign_key: { to_table: :chats }
      t.references :sender, index: true, foreign_key: { to_table: :hacknu_users }
      t.references :receiver, index: true, foreign_key: { to_table: :hacknu_users }
      t.timestamps
    end
  end
end

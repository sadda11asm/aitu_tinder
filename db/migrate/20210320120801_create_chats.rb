class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :first_user, index: true, foreign_key: { to_table: :hacknu_users }
      t.references :second_user, index: true, foreign_key: { to_table: :hacknu_users }
      t.timestamps
    end
  end
end

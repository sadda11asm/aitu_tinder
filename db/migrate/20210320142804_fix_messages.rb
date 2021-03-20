class FixMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :receiver_id
    add_column :messages, :text, :string
  end
end

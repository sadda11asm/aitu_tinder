class AddSignToHacknuUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :hacknu_users, :sign, :string
  end
end

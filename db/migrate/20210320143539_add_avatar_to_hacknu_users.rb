class AddAvatarToHacknuUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :hacknu_users, :avatar_url, :string
  end
end

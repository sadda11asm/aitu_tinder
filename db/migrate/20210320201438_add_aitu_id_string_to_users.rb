class AddAituIdStringToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :hacknu_users, :aitu_id_string, :string
  end
end

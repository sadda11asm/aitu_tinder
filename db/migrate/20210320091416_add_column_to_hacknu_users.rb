class AddColumnToHacknuUsers < ActiveRecord::Migration[5.2]
  def change

    add_column :hacknu_users, :aitu_id, :bigint

  end
end

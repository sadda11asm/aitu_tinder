class CreateHacknuUserTags < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tags do |t|
      t.references :user, index: true, foreign_key: { to_table: :hacknu_users }
      t.references :tag, index: true, foreign_key: { to_table: :tags }
    end
  end
end

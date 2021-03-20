class CreateHacknuTopicTags < ActiveRecord::Migration[5.2]
  def change
    create_table :hacknu_topic_tags do |t|

      t.references :topic, index: true, foreign_key: { to_table: :hacknu_topics }

      t.timestamps
    end
  end
end

class ChangeColumnToHacknuTopicTags < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :hacknu_topic_tags, :hacknu_tags, column: :tag_id
  end
end

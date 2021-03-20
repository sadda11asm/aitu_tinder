class AddColumnToHacknuTopicTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :hacknu_topic_tags, :tag, index: true
  end
end

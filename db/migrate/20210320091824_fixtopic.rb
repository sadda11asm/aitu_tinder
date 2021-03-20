class Fixtopic < ActiveRecord::Migration[5.2]
  def change
    rename_table :hacknu_topics, :topics
    rename_table :hacknu_topic_rooms, :topic_rooms
    rename_table :hacknu_tags, :tags
    rename_table :hacknu_topic_tags, :topic_tags
  end
end

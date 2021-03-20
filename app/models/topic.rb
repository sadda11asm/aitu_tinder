class Topic < ApplicationRecord
  has_many :topic_tags
  has_many :topic_rooms
  has_many :tags, through: :topic_tags

  accepts_nested_attributes_for :topic_tags

  def people_count
    topic_rooms.size
  end
end

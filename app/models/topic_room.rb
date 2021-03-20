class TopicRoom < ApplicationRecord
  after_initialize :set_defaults

  def set_defaults
    free ||= true
  end
end

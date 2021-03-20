class Message < ApplicationRecord
  belongs_to :sender, class_name: 'HacknuUser'
  belongs_to :chat
end

class Chat < ApplicationRecord
  belongs_to :first_user, class_name: 'HacknuUser'
  belongs_to :second_user, class_name: 'HacknuUser'
  has_many :messages
end

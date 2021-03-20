class UserTag < ApplicationRecord
  belongs_to :user, class_name: 'HacknuUser'
  belongs_to :tag
end
class HacknuPreference < ApplicationRecord
  belongs_to :user, class_name: 'HacknuUser'
end

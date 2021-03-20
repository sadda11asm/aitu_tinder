class HacknuLike < ApplicationRecord
  belongs_to :fan, class_name: 'HacknuUser'
  belongs_to :crush, class_name: 'HacknuUser'
end

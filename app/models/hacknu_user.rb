class HacknuUser < ApplicationRecord

  has_one :hacknu_preference, foreign_key: :user_id
  has_many :hacknu_likes

  has_many :user_tags, foreign_key: :user_id
  has_many :tags, through: :user_tags
  accepts_nested_attributes_for :user_tags

  scope :filter_by_preferences, -> (user, minLng, maxLng, minLat, maxLat) {

      # square = square(user.lng, user.lat, user.hacknu_preference.distance)
      where("(hacknu_users.age BETWEEN ? AND ?) AND
              (hacknu_users.gender !=  ?)",
            user.hacknu_preference.min_age,
            user.hacknu_preference.max_age,
            user.gender
            )
  }

  scope :filter_by_likes, -> (user) {
    where.not(id: HacknuLike.where(fan_id: user.id, fan_like_type: "dislike").select(:fan_id))
  }

  def chats
    Chat.where(first_user_id: id).or(Chat.where(second_user_id: id))
  end

  def hacknu_likes

  end

end

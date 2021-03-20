class HacknuUser < ApplicationRecord

  has_one :hacknu_preference, foreign_key: :user_id
  accepts_nested_attributes_for :hacknu_preference
  has_many :hacknu_likes, foreign_key: :crush_id
  has_many :liked, foreign_key: :fan_id

  has_many :user_tags, foreign_key: :user_id
  has_many :tags, through: :user_tags
  accepts_nested_attributes_for :user_tags

  scope :filter_by_preferences, -> (user, minLng, maxLng, minLat, maxLat) {
      where("(hacknu_users.age BETWEEN ? AND ?) AND
              (hacknu_users.gender !=  ?) AND
              (hacknu_users.lng BETWEEN ? AND ?) AND
              (hacknu_users.lat BETWEEN ? AND ?)",
            user.hacknu_preference.min_age,
            user.hacknu_preference.max_age,
            user.gender,
            minLng, maxLng,
            minLat, maxLat
            )
  }

  scope :filter_by_likes, -> (user) {
    where.not(id: HacknuLike.where(fan_id: user.id).select(:fan_id))
  }

  def chats
    Chat.where(first_user_id: id).or(Chat.where(second_user_id: id))
  end

  def matches
    HacknuLike.where(crush_id: id, matched: true).or(HacknuLike.where(fan_id: id, matched: true)).map do |like|
      if like.fan.id == id
        like.crush
      else
        like.fan
      end
    end
  end


end

class HacknuUser < ApplicationRecord

  has_one :hacknu_preference, foreign_key: :user_id



  scope :filter_by_preferences, -> (user, minLng, maxLng, minLat, maxLat) {

      # square = square(user.lng, user.lat, user.hacknu_preference.distance)
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

end

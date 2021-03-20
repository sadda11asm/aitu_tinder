module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uuid

    def connect
      # if cookies[:token].nil?
      self.uuid = SecureRandom.urlsafe_base64
      # end


    end
  end
end

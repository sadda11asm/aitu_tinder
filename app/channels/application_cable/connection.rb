module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :aitu_id

    def connect
      self.aitu_id = request.headers['Authorization']
      reject_unauthorized_connection if self.aitu_id.nil?
    end
  end
end

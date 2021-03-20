class ApplicationController < ActionController::API

  def authenticate_user!
    head :unauthorized unless registered_user
  end

  def registered_user
    return unless auth_header
    id = auth_header

    @user = HacknuUser.find_by(aitu_id: id)
  end

  def auth_header
    request.headers['Authorization']
  end

end

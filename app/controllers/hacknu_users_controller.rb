class HacknuUsersController < ApplicationController
  before_action :set_hacknu_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /hacknu_users
  def index
    user = @user

    hacknu_users = HacknuUser.all.includes(:hacknu_preference)
    square = square(params[:lng], params[:lat], user.hacknu_preference.distance)

    # if params[:by_preferences].present?
         hacknu_users = hacknu_users.filter_by_preferences(user, square[0],square[1],square[2],square[3])
    # end

    @hacknu_users = hacknu_users

    render json: @hacknu_users
  end

  # GET /hacknu_users/1
  def show
    render json: @hacknu_user
  end

  # POST /hacknu_users
  # def create
  #   @hacknu_user = HacknuUser.new(hacknu_user_params)
  #
  #   if @hacknu_user.save
  #     render json: @hacknu_user, status: :created, location: @hacknu_user
  #   else
  #     render json: @hacknu_user.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /hacknu_users/1
  # def update
  #   if @hacknu_user.update(hacknu_user_params)
  #     render json: @hacknu_user
  #   else
  #     render json: @hacknu_user.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /hacknu_users/1
  def destroy
    @hacknu_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_user
      @hacknu_user = HacknuUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_user_params
      params.require(:hacknu_user).permit(:name, :lastname, :age, :lat, :lng, :gender, :city)
    end

  R = 6371.0

  def square(lng, lat, rad)
    maxLat = lat.to_f + ((rad / R) * Math::PI / 180)
    minLat = lat.to_f - ((rad / R) * Math::PI / 180)
    maxLng = lng.to_f + (Math.asin(rad / R) / Math.cos(lat.to_f / 180 * Math::PI)) * Math::PI / 180
    minLng = lng.to_f - (Math.asin(rad / R) / Math.cos(lat.to_f / 180 * Math::PI)) * Math::PI / 180
    [minLng, maxLng, minLat, maxLat]
  end

end

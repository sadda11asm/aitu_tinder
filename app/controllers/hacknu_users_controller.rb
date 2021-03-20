class HacknuUsersController < ApplicationController
  before_action :set_hacknu_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :update, :get_liked_by_users]

  # GET /hacknu_users
  def index

    hacknu_users = HacknuUser.all.includes(:hacknu_preference)
    square = square(params[:lng], params[:lat], @user.hacknu_preference.distance)

    # if params[:by_preferences].present?
         hacknu_users = hacknu_users.filter_by_preferences(@user, square[0],square[1],square[2],square[3])
    # end
    #
    hacknu_users = hacknu_users.filter_by_likes(@user)

    @hacknu_users = hacknu_users

    render json: @hacknu_users
  end

  def get_liked_by_users
    @liked_users = HacknuUser.joins(:hacknu_likes)
                              .where("hacknu_likes.crush_id = ?", @user.id)

    render json: @liked_users
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
  def update

    @hacknu_likes = HacknuLike.find_by(crush_id: @user.id, fan_id: @hacknu_user.id)

    hacknu_user_like_type = hacknu_user_params[:like_type]

    if @hacknu_likes.present?
      @hacknu_likes.update(crush_like_type: hacknu_user_like_type, crush_id: @user.id)
      if @hacknu_likes.fan_like_type == @hacknu_likes.crush_like_type
        @hacknu_likes.update(matched: true)
      end
    else
      @hacknu_likes = HacknuLike.new(fan_id: @user.id, crush_id: @hacknu_user.id, fan_like_type: hacknu_user_like_type)
    end

    if @hacknu_likes.save
      render json: @hacknu_likes, status: :created
    else
      render json: @hacknu_user.errors, status: :unprocessable_entity
    end

  end

  # DELETE /hacknu_users/1
  def destroy
    @hacknu_user.destroy
  end


  def sign_up
    my_id = request.headers['Authorization']
    @current_user = HacknuUser.create!(id: my_id, aitu_id: my_id)
    @current_user.update(user_params)

    for tag in tag_params[:ids].split(",")
      @user_tags = UserTag.new(user_id: my_id, tag_id: tag)
      @user_tags.save!
    end

    if @current_user.save
      render json: @current_user, status: :created, location: @current_user
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_user
      @hacknu_user = HacknuUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_user_params
      params.require(:hacknu_user).permit(:like_type)
    end

    def user_params
      params.require(:user).permit(:name, :lastname, :age, :gender, :city, :lng, :lat, :avatar_url)
    end

    def tag_params
      params.require(:tags).permit(:ids)
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

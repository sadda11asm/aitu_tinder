class HacknuUsersController < ApplicationController
  before_action :set_hacknu_user, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :update, :destroy,
                                            :get_liked_by_users,
                                            :get_liked_users,
                                            :get_matched_users,
                                            :get_random_user]

  # GET /hacknu_users
  def index
    hacknu_users = HacknuUser.all.joins(:hacknu_preference).includes(:hacknu_preference)
    square = square(@user.lng, @user.lat, @user.hacknu_preference&.distance)

    if @user.hacknu_preference.present?
      hacknu_users = hacknu_users.filter_by_preferences(@user, square[0], square[1], square[2], square[3])
    end
    hacknu_users = hacknu_users.filter_by_likes(@user)

    @hacknu_users = hacknu_users
    render json: @hacknu_users
  end

  def get_liked_by_users
    render json: @user.fans
  end

  def get_liked_users
    @liked_users = HacknuUser.joins(:hacknu_likes)
                             .where("hacknu_likes.fan_id = ?", @user.id)
    render json: @liked_users
  end

  def get_matched_users
    @matched_users = @user.matches

    render json: @matched_users
  end

  # GET /hacknu_users/1
  def show
    render json: ::UserBlueprint.render(@hacknu_user)

  end

  def get_random_user
    @random_user = HacknuUser.all.joins(:hacknu_preference).includes(:hacknu_preference)
    # square = square(@user.lng, @user.lat, @user.hacknu_preference&.distance)
    # if @user.hacknu_preference.present?
    #   @random_user = @random_user.filter_by_preferences(@user, square[0], square[1], square[2], square[3])
    # end
    @random_user = @random_user.where.not(gender: @user.gender).order("RANDOM()").limit(1)[0]
    if @random_user.present?
      render json: @random_user
    else
      render json: @hacknu_user.errors, status: :not_found
    end
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
    @like = HacknuLike.find_by(crush_id: @user.id, fan_id: @hacknu_user.id)
    user_like_type = hacknu_user_params[:like_type]

    if @like.present?
      @like.update(crush_like_type: user_like_type, crush_id: @user.id)
      if @like.fan_like_type == @like.crush_like_type and @like.fan_like_type != 'dislike'
        @like.update(matched: true)
      end
    else
      @like = HacknuLike.new(fan_id: @user.id, crush_id: @hacknu_user.id, fan_like_type: user_like_type)
    end

    if @like.save
      render json: @like, status: :created
    else
      render json: @hacknu_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hacknu_users/1
  def destroy
    @my_like = HacknuLike.find_by(fan_id: @user.id, crush_id: @hacknu_user.id)

    if @my_like.present?
      @my_like.destroy
    else
      render json: @order.errors, status: :not_found
    end

  end


  def sign_up
    my_id = request.headers['Authorization']
    @current_user = HacknuUser.create!(id: my_id, aitu_id: my_id)
    @current_user.update(user_params)

    if @current_user.save
      render json: @current_user, status: :created, location: @current_user
    else
      render json: @current_user.errors, status: :unprocessable_entity
    end
  end

  def who_am_i
    my_id = request.headers['Authorization']
    @me = HacknuUser.find(my_id)
    if @me.present?
      render json: ::UserBlueprint.render(@me)
    else
      render json: @me.errors, status: :not_found
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacknu_user
      @hacknu_user = HacknuUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hacknu_user_params
      params.permit(:like_type)
    end

    def user_params
      params.permit(:name, :lastname, :age, :gender, :city, :lng, :lat, :avatar_url, :sign, :aitu_id_string,
                    user_tags_attributes: [:tag_id], hacknu_preference_attributes: [:min_age, :max_age, :distance])
    end



  R = 6371.0

  def square(lng, lat, rad)
    rad /= 1000
    maxLat = lat + ((rad.to_f / R) * Math::PI / 180)*1000
    minLat = lat - ((rad.to_f / R) * Math::PI / 180)*1000
    maxLng = lng + (Math.asin(rad.to_f / R) / Math.cos(lat / 180 * Math::PI)) * Math::PI / 180*1000
    minLng = lng - (Math.asin(rad.to_f / R) / Math.cos(lat / 180 * Math::PI)) * Math::PI / 180*1000
    [minLng, maxLng, minLat, maxLat]
  end

end

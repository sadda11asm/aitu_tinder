class TopicRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic_room, only: [:show, :update, :destroy]

  # GET /topic_rooms
  def index
    @topic_rooms = TopicRoom.all

    render json: @topic_rooms
  end

  # GET /topic_rooms/1
  def show
    render json: @topic_room
  end

  # POST /topic_rooms
  def create
    @topic_room = TopicRoom.new(topic_room_params)

    if @topic_room.save
      render json: @topic_room, status: :created, location: @topic_room
    else
      render json: @topic_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topic_rooms/1
  def update
    if @topic_room.update(topic_room_params)
      render json: @topic_room
    else
      render json: @topic_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /topic_rooms/1
  def destroy
    @topic_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic_room
      @topic_room = TopicRoom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def topic_room_params
      params[:free] = true
      params[:user_id] = @user.id
      params.permit(:user_id, :topic_id, :free)
    end
end

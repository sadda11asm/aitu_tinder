class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /chats
  def index
    @chats = @user.chats

    render json: ::ChatBlueprint.render(@chats, user: @user)
  end

  # GET /chats/1
  def show
    render json: @chat
  end

  # POST /chats
  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      render json: @chat, status: :created, location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_chat
    @chat = Chat.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def chat_params
    params[:first_user_id] = @user.id
    params[:second_user_id] = params[:user_id]
    params.permit(:first_user_id, :second_user_id)
  end
end

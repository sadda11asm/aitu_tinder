class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: %i[index create]
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    @messages = @chat.messages.order(created_at: :desc)

    render json: ::MessageBlueprint.render(@messages, user: @user)
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      receiver = if @chat.first_user == @user
                   @chat.second_user
                 else
                   @chat.first_user
                 end
      notify_user(receiver, @message,'new_message')
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def notify_user(user, message, action)
    ActionCable.server.broadcast(
      "message_channel_#{user.aitu_id}",
      message: {
        action: action,
        order_item: ::MessageBlueprint.render(message).to_json
      }
    )
  end
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def message_params
    params[:sender_id] = @user.id
    params.permit(:chat_id, :sender_id, :text)
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end
end

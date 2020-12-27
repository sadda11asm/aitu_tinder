class CartChannel < ApplicationCable::Channel
  def subscribed
    stream_from "cart_channel_#{uuid}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

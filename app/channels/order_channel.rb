class OrderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "order_channel_#{uuid}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

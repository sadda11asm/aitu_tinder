class CardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "card_channel_#{uuid}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

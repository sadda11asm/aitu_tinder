class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel_#{aitu_id}"
  end

  def unsubscribed
    stop_all_streams
  end
end

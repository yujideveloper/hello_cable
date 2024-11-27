class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    logger.info "MessageChannel#receive: #{data}"
    ActionCable.server.broadcast "message_channel", data
  end
end

# frozen_string_literal: true

class MessageBrokerJob < ApplicationJob
  queue_as :default

  def perform(message:)
    ActionCable.server.broadcast("message_channel", { message: message.to_broadcast_message })
  end
end

# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_account

  def create
    message_room = MessageRoom.find(params.dig(:message, :message_room_id))
    message = message_room.messages.build(message_params)

    message.save!

    MessageBrokerJob.perform_later(message: message)

    head :created
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(account: current_account)
  end
end

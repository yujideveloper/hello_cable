# frozen_string_literal: rrue

class DashboardController < ApplicationController
  def index
    message_room_id = params[:message_room_id] || MessageRoom.ids.sample

    @message_room = MessageRoom.find(message_room_id)
  end
end

# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :account
  belongs_to :message_room

  alias_attribute :posted_at, :created_at

  def to_broadcast_message
    {
      body: body,
      posted_at: posted_at,
      author: account.email
    }
  end
end

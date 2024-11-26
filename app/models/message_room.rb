# frozen_string_literal: true

class MessageRoom < ApplicationRecord
  has_many :messages
end

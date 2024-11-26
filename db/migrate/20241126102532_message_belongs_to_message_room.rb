class MessageBelongsToMessageRoom < ActiveRecord::Migration[8.0]
  def change
    add_reference :messages, :message_room, null: false, foreign_key: true, index: true
  end
end

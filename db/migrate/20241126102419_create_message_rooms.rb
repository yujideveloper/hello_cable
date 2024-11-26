class CreateMessageRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :message_rooms do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

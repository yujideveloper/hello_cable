class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.belongs_to :account, null: false, foreign_key: true, index: true

      t.string :body

      t.timestamps
    end
  end
end

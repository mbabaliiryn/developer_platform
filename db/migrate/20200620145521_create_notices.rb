class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.string :body
      t.bigint :sender_id
      t.bigint :recipient_id
      t.integer :chat_id

      t.timestamps
    end
    add_index :notices, :recipient_id
    add_index :notices, :sender_id
  end
end

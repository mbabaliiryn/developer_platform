# frozen_string_literal: true

class AddForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key 'groups', 'users'
    add_foreign_key 'notices', 'users', column: 'recipient_id'
    add_foreign_key 'notices', 'users', column: 'sender_id'
    add_foreign_key 'projects', 'users'
    add_foreign_key 'tasks', 'users'
end
end

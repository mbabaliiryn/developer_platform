# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.bigint :user_id
      t.integer :project_id
      t.string :icon

      t.timestamps
    end
    add_index :groups, :user_id
  end
end

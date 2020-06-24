# frozen_string_literal: true

class CreateManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :managers do |t|
      t.string :function

      t.timestamps
    end
  end
end

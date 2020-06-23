class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.bigint :user_id

      t.timestamps
    end
    add_index :projects, :user_id
  end
end

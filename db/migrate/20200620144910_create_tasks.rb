class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.bigint :user_id
      t.decimal :amount
      t.boolean :status
      
      t.integer :group_id

      t.timestamps
    end
    add_index :tasks, :user_id
  end
end

class MakeUsersPolymorphic < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_id, :integer
    add_column :users, :profile_type, :string
  end
end

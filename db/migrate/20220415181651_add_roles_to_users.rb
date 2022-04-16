class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def self.up
    add_column :users, :admin_role, :boolean, default: false
    add_column :users, :user_role, :boolean, default: true
  end

  def self.down
    remove_column :users, :admin_role
    remove_column :users, :user_role
  end
end

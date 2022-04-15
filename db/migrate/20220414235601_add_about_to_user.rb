class AddAboutToUser < ActiveRecord::Migration[7.0]
  def self.up
    add_column :users, :about, :text
  end

  def self.down
    remove_column :users, :about
  end
end

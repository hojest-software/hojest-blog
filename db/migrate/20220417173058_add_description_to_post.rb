class AddDescriptionToPost < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :description, :text
  end

  def self.down
    remove_column :posts, :description
  end
end

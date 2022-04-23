class AddStoryToPosts < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :story, :boolean, default: false
  end

  def self.down
    remove_column :posts, :story
  end
end

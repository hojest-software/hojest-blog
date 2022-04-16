class AddPublishedToPosts < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :published, :boolean, default: false
  end

  def self.down
    remove_column :posts, :published
  end
end

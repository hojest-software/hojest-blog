class AddTopicsToPosts < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :topics, :string, array: true, default: []
  end

  def self.down
    remove_column :posts, :topics
  end
end

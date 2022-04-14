class AddPostAssociationToUser < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :user_id, :integer
    add_index 'posts', ['user_id'], :name => 'index_user_id'
  end

  def self.down
    remove_column :posts, :user_id
  end
end

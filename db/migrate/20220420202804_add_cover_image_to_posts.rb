class AddCoverImageToPosts < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :cover_image, :string
  end

  def self.down
    remove_column :posts, :cover_image
  end
end

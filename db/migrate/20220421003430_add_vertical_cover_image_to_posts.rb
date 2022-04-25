class AddVerticalCoverImageToPosts < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :vertical_cover_image, :string
  end

  def self.down
    remove_column :posts, :vertical_cover_image
  end
end

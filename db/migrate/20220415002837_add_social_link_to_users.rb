class AddSocialLinkToUsers < ActiveRecord::Migration[7.0]
  def self.up
    add_column :users, :social_link, :string
  end

  def self.down
    remove_column :users, :social_link
  end
end

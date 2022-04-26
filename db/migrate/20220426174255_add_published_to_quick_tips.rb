class AddPublishedToQuickTips < ActiveRecord::Migration[7.0]
  def self.up
    add_column :quick_tips, :published, :boolean, default: false
  end

  def self.down
    remove_column :quick_tips, :published
  end
end

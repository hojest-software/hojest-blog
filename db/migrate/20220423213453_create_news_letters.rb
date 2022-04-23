class CreateNewsLetters < ActiveRecord::Migration[7.0]
  def change
    create_table :news_letters do |t|
      t.string :email
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

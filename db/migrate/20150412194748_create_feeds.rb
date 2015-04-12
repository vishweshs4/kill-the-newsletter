class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :token

      t.timestamps null: false
    end
    add_index :feeds, :token, unique: true
  end
end

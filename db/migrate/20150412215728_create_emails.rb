class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :from
      t.string :subject
      t.string :html
      t.string :text
      t.references :feed, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

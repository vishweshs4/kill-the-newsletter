class AddNullConstraintsToFeeds < ActiveRecord::Migration
  def change
    change_column_null :feeds, :title, false
    change_column_null :feeds, :token, false
  end
end

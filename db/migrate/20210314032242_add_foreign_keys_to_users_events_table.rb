class AddForeignKeysToUsersEventsTable < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :users_events, :users
    add_foreign_key :users_events, :events
  end
end

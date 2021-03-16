class RemoveTimestampsFromUsersEvents < ActiveRecord::Migration[6.1]
  def change
    remove_columns :users_events, :created_at, :updated_at
  end
end

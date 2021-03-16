class AddDefaultDateToEvents < ActiveRecord::Migration[6.1]
  def change
    change_column :events, :date, :datetime, default: -> { 'CURRENT_DATE' }
  end
end

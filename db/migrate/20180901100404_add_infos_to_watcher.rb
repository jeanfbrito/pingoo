class AddInfosToWatcher < ActiveRecord::Migration[5.2]
  def change
    add_column :watchers, :current_response, :text
    add_column :watchers, :previous_response, :text
    add_column :watchers, :last_watched, :datetime
  end
end

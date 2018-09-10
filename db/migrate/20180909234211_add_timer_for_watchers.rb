class AddTimerForWatchers < ActiveRecord::Migration[5.2]
  def change
    add_column :watchers, :timer, :integer, default: 1, null: false
  end
end

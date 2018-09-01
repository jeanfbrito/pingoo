class CreateWatchers < ActiveRecord::Migration[5.2]
  def change
    create_table :watchers do |t|
      t.string :name
      t.string :url
      t.string :current_status
      t.string :previous_status

      t.timestamps
    end
  end
end

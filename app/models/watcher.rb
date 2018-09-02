class Watcher < ApplicationRecord
  validates :name, :url, presence: true

  def watch_it
    response = HTTP.get(url)

    update(
      last_watched: Time.zone.now,
      current_status: response.code.to_s,
      previous_status: current_status,
      current_response: response.to_s,
      previous_response: current_response  
    )
  end
end

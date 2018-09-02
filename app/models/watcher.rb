class Watcher < ApplicationRecord
  def watch_it
    self.previous_status = self.current_status
    self.previous_response = self.current_response
    response = HTTP.get(self.url)
    self.current_status = response.code.to_s
    self.current_response = response.to_s
    self.last_watched = Time.zone.now
    self.save!
  end
end

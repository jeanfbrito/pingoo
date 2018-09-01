class Watcher < ApplicationRecord
  def watch_it
    require "http"
    self.previous_status = self.current_status
    previous_response = current_response
    response = HTTP.get(self.url)
    self.current_status = response.code.to_s
    self.current_response = response.to_s
    self.last_watched = Time.zone.now
    self.save!
  end
end

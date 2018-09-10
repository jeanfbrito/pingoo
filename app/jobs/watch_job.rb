class WatchJob < ApplicationJob
  queue_as :high

  def perform(watcher_id)
    watcher = Watcher.find_by(id: watcher_id)
    
    return if watcher.blank?

    response = HTTP.get(watcher.url)

    watcher.update(
      last_watched: Time.zone.now,
      current_status: response.code.to_s,
      previous_status: watcher.current_status,
      current_response: response.to_s,
      previous_response: watcher.current_response
    )

    WatchJob.set(wait: watcher.timer.minutes).perform_later(watcher.id)
  end
end

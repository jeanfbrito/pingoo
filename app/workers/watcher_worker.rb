class WatcherWorker
  include Sidekiq::Worker
  
  def perform(watcher_id)
    Watcher.find(watcher_id).watch_it
  end
end

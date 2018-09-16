namespace :workers do
  desc "Initialize all watchers"
  task init: :environment do
    puts "Scheduling workers ... "
    
    Watcher.find_each do |watcher|
      puts watcher.id
      WatchJob.set(wait: watcher.timer.minutes)
              .perform_later(watcher.id)
    end
  end
end
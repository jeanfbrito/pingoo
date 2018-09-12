web: bundle exec puma -t 2:2 -p ${PORT:-3000} -e ${RACK_ENV:-production}
worker: bundle exec sidekiq -C config/sidekiq.yml
release: bin/release

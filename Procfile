web: bin/rails server -p $PORT -e $RAILS_ENV
worker: bundle exec sidekiq -t 25 -C config/sidekiq.yml
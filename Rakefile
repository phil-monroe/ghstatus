# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Backlogger::Application.load_tasks

namespace :cache do
  task clear: :environment do
    Rails.cache.clear
  end
end

set :stages, %w(production staging linode)
set :default_stage, 'staging'

require 'capistrano/ext/multistage'

require 'bundler/capistrano'
set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"

set :application, "chi"

set :scm, :git
set :repository,  "git@github.com:kiindly/campaigns.git"

set :use_sudo, false
set :deploy_to, "/home/kiindly/campaigns/chi"
set :deploy_via, :remote_cache

after "deploy", "deploy:migrate"

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  # add the db:seed task (http://bit.ly/U2wpzm)
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end

  task :uname do
    run "uname -a"
  end

  task :tailprod do
    run "cd #{current_path}; tail -f log/production.log"
  end

end


require './config/boot'

set :stages, %w(production staging vagrant)
set :default_stage, 'vagrant'

require 'capistrano/ext/multistage'

require 'bundler/capistrano'
set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"

set :application, "lts"

set :scm, :git
set :repository,  "git@github.com:kiindly/campaigns.git"

set :use_sudo, false
set :deploy_to, "/var/www/lts.kiindly.com"
set :deploy_via, :copy

set :user, 'root'

set :rails_env, 'production'

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

  #TODO: Remove this hack when Capistrano is working with the Rails 2.0 asset pipeline
  #https://github.com/capistrano/capistrano/issues/362
  #namespace :assets do
    #task :precompile, :roles => assets_role, :except => { :no_release => true } do
      #run <<-CMD.compact
        #cd -- #{latest_release.shellescape} &&
        ##{rake} RAILS_ENV=#{rails_env.to_s.shellescape} #{asset_env} assets:precompile
      #CMD
    #end
  #end
end


require './config/boot'

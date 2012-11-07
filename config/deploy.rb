require 'bundler/capistrano'
set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby-local-exec"
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :application, "chi"
set :repository,  "git@github.com:derekcroft/kiindly.git"

set :scm, :git
set :use_sudo, false
set :deploy_to, "/home/kiindly/campaigns/chi"
set :deploy_via, :remote_cache

after "deploy", "deploy:migrate"

server "kiindly", :app, :web, :db, primary: true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end

# add the db:seed task (http://bit.ly/U2wpzm)
namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end

# only precompile assets if they have changed (http://bit.ly/PkMfa3)
#namespace :deploy do
  #namespace :assets do
    #task :precompile, :roles => :web, :except => { :no_release => true } do
      #from = source.next_revision(current_revision)
      #if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        #run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      #else
        #logger.info "Skipping asset pre-compilation because there were no asset changes"
      #end
    #end
  #end
#end

        require './config/boot'
        require 'airbrake/capistrano'

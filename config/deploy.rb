require 'bundler/capistrano'

set :application, "chi"
set :repository,  "git@github.com:derekcroft/kiindly.git"

set :scm, :git
set :use_sudo, false
set :deploy_to, "/home/kiindly/campaigns/chi"

server "kiindly", :app, :web, :db, primary: true
#role :web, "kiindly"                          # Your HTTP server, Apache/etc
#role :app, "kiindly"                          # This may be the same as your `Web` server
#role :db,  "kiindly", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

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

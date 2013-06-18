set :default_environment, {
  'PATH' => "/root/.rbenv/shims:/root/.rbenv/bin:/usr/pgsql-9.1/bin:$PATH"
}

set :deploy_to, "/var/www/lts.kiindly.com"

server "hotbbq", :app, :web, :db, primary: true

#require 'airbrake/capistrano'

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :deploy_to, "/var/www/chi"

server "wild", :app, :web, :db, primary: true

require 'airbrake/capistrano'

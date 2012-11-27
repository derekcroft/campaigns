set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :deploy_to, "/mnt/cbsvolume1/var/www/campaigns"

server "wild", :app, :web, :db, primary: true

require 'airbrake/capistrano'

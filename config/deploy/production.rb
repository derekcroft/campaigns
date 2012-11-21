set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

server "kiindly", :app, :web, :db, primary: true

require 'airbrake/capistrano'

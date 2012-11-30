set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :deploy_to, "/var/www/campaigns"

server "wild", :app, :web, :db, primary: true

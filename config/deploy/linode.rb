set :rvm_ruby_string, '1.9.3'
set :rails_env, 'staging'

require 'rvm/capistrano'

server "kiindly2", :app, :web, :db, primary: true

# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, 'bbq'
set :repo_url, 'git@github.com:manzhaimaksim/bbq.git'
set :deploy_to, '/home/deploy/apps/bbq'
append :linked_files, 'config/application.yml', 'config/master.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'
set :assets_roles, []

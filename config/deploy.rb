require "rvm/capistrano"
require "bundler/capistrano"

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

set :application, "question-services"
set :repository,  "git@github.com:Benwithjammin/question-services.git"

set :deploy_to, "/var/www/rails/#{application}"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "deployer"
set :group, "www-data"
set :scm_username, "deployer"
set :use_sudo, false
set :branch, "master"
set :ssh_options, {:forward_agent => true}
set :rails_env, "production"

set :rvm_ruby_string, 'ruby-1.9.3-p125'
set :rvm_type, :user  # Don't use system-wide RVM
set :keep_releases, 3

before "deploy:assets:precompile", "bundle:install"
default_run_options[:pty] = true

role :web, "questions.benporter.eu"                          # Your HTTP server, Apache/etc
role :app, "questions.benporter.eu"                          # This may be the same as your `Web` server
role :db,  "questions.benporter.eu", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


namespace :deploy do

  desc "Start unicorns for #{rails_env}"
  task :start, roles: :app, except: { no_release: true } do
    run "/etc/init.d/unicorn_#{application} start"
  end

  desc "Stop unicorns for #{rails_env}"
  task :stop, roles: :app, except: { no_release: true } do
    run "/etc/init.d/unicorn_#{application} stop"
    sleep 2
  end

  desc "Reload unicorns for #{rails_env} - no downtime"
  task :reload, roles: :app, except: { no_release: true } do
    run "/etc/init.d/unicorn_#{application} reload"
  end

  desc "Restart unicorns for #{rails_env}"
  task :restart, roles: :app, except: { no_release: true } do
    run "/etc/init.d/unicorn_#{application} stop"
    sleep 5
    run "/etc/init.d/unicorn_#{application} start"
  end
end
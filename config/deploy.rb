default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :application, "pianodb"
set :repository,  "git@github.com:yakloinsteak/pianodb.git"
set :user, 'pianodbc'
set :use_sudo, false
set :deploy_to,  '/home3/pianodbc/pianodbv2'
set :scm, :git
set :bundle_cmd, 'source $HOME/.bashrc && /home3/pianodbc/ruby/gems/bin/bundle'

role :web, "pianodb.com"                   # Your HTTP server, Apache/etc
role :app, "pianodb.com"                   # This may be the same as your `Web` server
role :db,  "pianodb.com", :primary => true # This is where Rails migrations will run

after "bundle:install", :configure_database
desc "copy databse.yml into the current release path"
task :configure_database do
  db_config = "#{deploy_to}/shared/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

after "deploy:update_code", :configure_htaccess
desc "copy .htaccess into the current release path."
task :configure_htaccess  do
  db_config = "#{deploy_to}/shared/htaccess"
  run "cp #{db_config} #{release_path}/public/.htaccess"
end

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

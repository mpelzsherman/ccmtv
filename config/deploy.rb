default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :application, "pianodb"
set :repository,  "git@github.com:yakloinsteak/pianodb.git"
set :user, 'pianodbc'
set :use_sudo, false
set :deploy_to,  '/home3/pianodbc/pianodbv2'
set :scm, :git

role :web, "pianodb.com"                   # Your HTTP server, Apache/etc
role :app, "pianodb.com"                   # This may be the same as your `Web` server
role :db,  "pianodb.com", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

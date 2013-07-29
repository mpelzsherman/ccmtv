# Do an `ssh-add` with the key you use for git before deployment
# Try `gem install capistrano_colors` if you like and require it in your ~/.caprc file.

ENV['EC2'] ||= '54.245.111.127'

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

set :default_environment, {
  'PATH' => '/opt/bitnami/memcached/bin:/opt/bitnami/perl/bin:/opt/bitnami/git/bin:/opt/bitnami/nginx/sbin:/opt/bitnami/sphinx/bin:/opt/bitnami/sqlite/bin:/opt/bitnami/php/bin:/opt/bitnami/mysql/bin:/opt/bitnami/apache2/bin:/opt/bitnami/subversion/bin:/opt/bitnami/ruby/bin:/opt/bitnami/common/bin:/opt/bitnami/memcached/bin:/opt/bitnami/perl/bin:/opt/bitnami/git/bin:/opt/bitnami/nginx/sbin:/opt/bitnami/sphinx/bin:/opt/bitnami/sqlite/bin:/opt/bitnami/php/bin:/opt/bitnami/mysql/bin:/opt/bitnami/apache2/bin:/opt/bitnami/subversion/bin:/opt/bitnami/ruby/bin:/opt/bitnami/common/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games'
}

set :application, "ccmtv"
set :repository,  "git@github.com:mpelzsherman/ccmtv.git"
set :user, 'bitnami'
set :use_sudo, false
set :deploy_to,  '/opt/bitnami/apps/ccmtv'
set :scm, :git
set :bundle_cmd, '/opt/bitnami/ruby/bin/bundle'

role :web, ENV['EC2']                   # Your HTTP server, Apache/etc
role :app, ENV['EC2']                   # This may be the same as your `Web` server
role :db,  ENV['EC2'], :primary => true # This is where Rails migrations will run

after "bundle:install", :configure_database
desc "copy databse.yml into the current release path"
task :configure_database do
  db_config = "#{deploy_to}/shared/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

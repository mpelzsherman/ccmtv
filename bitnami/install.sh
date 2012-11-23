# Start SSH agent
eval `ssh-agent`

# Add EC2 private key to the agent (download from EC2 console under 'key pairs')
ssh-add ./pianodb.pem

# If we've moved, this could change
export EC2=ec2-54-245-136-251.us-west-2.compute.amazonaws.com

# What I consider mandatory rc files for the bitnami user
scp ./.tmux.conf bitnami@${EC2}:/home/bitnami/.tmux.conf

ssh bitnami@$EC2
  sudo mkdir /home/bitnami/apps/pnodb
  sudo chown bitnami:daemon /home/bitnami/apps/pnodb
  sudo apt-get --yes install git
  sudo gem install bundler
  # Add export RAILS_ENV=production to .bashrc

scp ./database.yml bitnami@${EC2}:/home/bitnami/apps/pnodb/shared/database.yml

scp ./httpd-pnodb.conf bitnami@${EC2}:/home/bitnami/stack/


ssh bitnami@$EC2
  vim ~/stack/apache2/conf/httpd.conf
    SetEnv RAILS_ENV production
    Include conf/extra/httpd-pnodb.conf
  cd ~/stack
  sudo ./ctlscript.sh restart
  cd ~/apps/pnodb/current
  rails db -p
    source db/seed.sql
    exit
  rake db:migrate

# Hack /etc/hosts on your computer:
  54.245.136.251 pnodb.com


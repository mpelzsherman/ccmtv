# NOTE: This script is
# Start SSH agent
eval `ssh-agent`

# Add EC2 private key to the agent (download from EC2 console under 'key pairs')
# and place this file in the current directory
# Alternatively, have somebody with access setup your own key pair
ssh-add ./ccmtv.pem

# If we've moved or started a new instance, this could change
export EC2=54.245.111.127

# What I consider mandatory rc files for the bitnami user
scp ./.tmux.conf bitnami@${EC2}:/home/bitnami/.tmux.conf

ssh bitnami@$EC2
  sudo mkdir /home/bitnami/apps/ccmtv
  sudo chown bitnami:daemon /home/bitnami/apps/ccmtv
  sudo apt-get --yes install git
  sudo gem install bundler
  echo 'export RAILS_ENV=production' >> ~/.bashrc

scp ./database.yml bitnami@${EC2}:/home/bitnami/apps/ccmtv/shared/database.yml

scp ./httpd-ccmtv.conf bitnami@${EC2}:/home/bitnami/stack/apache2/conf/extra

ssh bitnami@$EC2
  vim ~/stack/apache2/conf/httpd.conf
    # Add these...
    SetEnv RAILS_ENV production
    Include conf/extra/httpd-ccmtv.conf
  cd ~/stack
  sudo ./ctlscript.sh restart
  cd ~/apps/ccmtv/current
  rake db:setup
  rake db:seed_fu

# Hack /etc/hosts on your computer:
sudo echo '54.245.111.127 ccmtv.com' >> /etc/hosts

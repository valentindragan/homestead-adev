#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.
#
# If you have user-specific configurations you would like
# to apply, you may also create user-customizations.sh,
# which will be run after this script.

# If you're not quite ready for Node 12.x
# Uncomment these lines to roll back to
# v11.x or v10.x

# Remove Node.js v12.x:
#sudo apt-get -y purge nodejs
#sudo rm -rf /usr/lib/node_modules/npm/lib
#sudo rm -rf //etc/apt/sources.list.d/nodesource.list

# Install Node.js v11.x
#curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
#sudo apt-get install -y nodejs

# Install Node.js v10.x
#curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
#sudo apt-get install -y nodejs

cd /usr/share
LATEST_VERSION=$(curl -sS 'https://api.github.com/repos/phpmyadmin/phpmyadmin/releases/latest' | awk -F '"' '/tag_name/{print $4}')
DOWNLOAD_URL="https://api.github.com/repos/phpmyadmin/phpmyadmin/tarball/$LATEST_VERSION"
PHPMYADMIN_SECRET=`openssl rand -base64 32`;
echo "Downloading phpMyAdmin $LATEST_VERSION"
sudo wget $DOWNLOAD_URL -q -O 'phpmyadmin.tar.gz'
sudo tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1
sudo rm phpmyadmin.tar.gz

echo "Installing dependencies for phpMyAdmin"
cd phpmyadmin && composer update --no-dev

echo "Generating phpMyAdmin secret code"
sudo sed -e "s|cfg\['blowfish_secret'\] = ''|cfg['blowfish_secret'] = '${PHPMYADMIN_SECRET}'|" config.sample.inc.php > config.inc.php
echo "Disable phpMyAdmin CheckConfigurationPermissions"
sed -i '2i $cfg['CheckConfigurationPermissions'] = false;' config.inc.php

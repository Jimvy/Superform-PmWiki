#!/usr/bin/env bash
# Inside this script, put everything needed to install the environment

yum -y install net-tools

cd /vagrant/files

# Search for an appropriate name for the file, change its mode, and make a link to reduce the clutter of commands
find . -name "xampp-linux-x64-*-installer.run" -execdir chmod +x {} \; -execdir ln -s {} xampp-installer.run \;

# execute it; normally it should use the defaults correctly
yes | ./xampp-installer.run
/opt/lampp/lampp stop

# Update permissions
cd /vagrant
chmod 777 studINGI

# Now, let's configure the server
cat /vagrant/files/httpd-vhosts.conf > /opt/lampp/etc/extra/httpd-vhosts.conf
sed -i "s/#Include etc\/extra\/httpd-vhosts.conf/Include etc\/extra\/httpd-vhosts.conf/g" /opt/lampp/etc/httpd.conf

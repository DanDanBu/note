#!/bin/bash
#This is a shell script for installation of redmine 2.6.6 on centOS 6.5
#ruby version 1.9.3-p551 
#user guide : ./redmine_install.sh WhichOS RedmineVersion RubyVersion RedminePath


#setup Redmine version & ruby version & passenger version
RedmineVersion="2.6.6"
Ruby="1.9.3"
RubyVersion="1.9.3-p551"
PassengerVersion="5.0.13"

#Install the dependencies packages
yum -y install nano zip unzip libyaml-devel zlib-devel curl-devel openssl-devel httpd-devel apr-devel apr-util-devel mysql-devel gcc ruby-devel gcc-c++ make postgresql-devel ImageMagick-devel sqlite-devel perl-LDAP mod_perl perl-Digest-SHA

#install Apache and Mysql 
yum -y install httpd mysql mysql-server

chkconfig httpd on
chkconfig mysqld on
service httpd start
service mysqld start

/usr/bin/mysql_secure_installation

#Turn off SELinux
sed -i '7c SELINUX=disabled' /etc/selinux/config

#--Set up host name

#Configuring the Firewall
sed -i '10a -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT \
-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT' /etc/sysconfig/iptables

sed -i '10a -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT \
-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT' /etc/sysconfig/ip6tables

/etc/init.d/iptables restart
/etc/init.d/ip6tables restart
chkconfig iptables on
chkconfig ip6tables on

#Install PHP and phpMyAdmin
yum -y install php php-mysql php-gd php-imap php-ldap php-mbstring php-odbc php-pear php-xml php-xmlrpc php-pecl-apc php-soap

service httpd restart
rpm --import http://dag.wieers.com/rpm/packages/RPM-GPG-KEY.dag.txt
yum install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
yum -y install phpmyadmin

#edit phpmyadmin.conf
sed -i '8c \ \ Allow from all' /etc/httpd/conf.d/phpmyadmin.conf
sed -i "29c \$cfg[\'Servers\'][\$i][\'auth_type\'] = \'http\'" /usr/share/phpmyadmin/config.inc.php
service httpd restart

#add 8080port to iptables
sed -i '12a -A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT' /etc/sysconfig/iptables
sed -i '12a -A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT' /etc/sysconfig/ip6tables

/etc/init.d/iptables restart
/etc/init.d/ip6tables restart
echo "enter your domain name"
read domain_name
sed -i '$a <VirtualHost *:8080> \
\ \ DocumentRoot /usr/share/phpmyadmin/ \
\ \ ServerName your_domain.com \
</VirtualHost>' /etc/httpd/conf/httpd.conf

sed -i "/ServerName/s/your_domain/$domain_name/" /etc/httpd/conf/httpd.conf
sed -i '137a Listen 8080' /etc/httpd/conf/httpd.conf

#Install Ruby
\curl -L https://get.rvm.io | bash
source /etc/profile.d/rvm.sh
rvm install $Ruby
ruby -v

#Install Rubygems
yum -y install rubygems

#Install Passenger
gem install passenger -v '$PassengerVersion'
passenger-install-apache2-module

echo "Create a new file in /etc/httpd/conf.d/passenger.conf"

cat <<EOF > /etc/httpd/conf.d/passenger.conf
LoadModule passenger_module /usr/local/rvm/gems/ruby-$RubyVersion/gems/passenger-$PassengerVersion/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
   PassengerRoot /usr/local/rvm/gems/ruby-$RubyVersion/gems/passenger-$PassengerVersion
   PassengerDefaultRuby /usr/local/rvm/gems/ruby-$RubyVersion/wrappers/ruby
</IfModule>
EOF

service httpd restart

#--Create Database for Redmine
echo "Please enter your mysql password:"
read MySqlPwd
echo "Please enter your database name:"
read RED_DB
echo "Please enter your user name:"
read RED_USER
echo "Please enter your user password:"
read RED_Pwd

mysql --user=root --password=${MySqlPwd}
create database ${RED_DB} character set utf8;
create user "\'${RED_USER}\'"@'localhost' identified by "\'${RED_Pwd}\'";
grant all privileges on ${RED_DB}.* to "\'${RED_USER}\'"@'localhost';

#Install Redmine
cd /var/www
wget http://www.redmine.org/releases/redmine-$RedmineVersion.tar.gz

tar xvfz redmine-$RedmineVersion.tar.gz
mv redmine-$RedmineVersion redmine
rm -rf redmine-$RedmineVersion.tar.gz

#setup database.yml
cd /var/www/redmine/config
cp database.yml.example database.yml
sed -i "8c \ \ database: $RED_DB" /var/www/redmine/config/database.yml
sed -i "10c \ \ username: $RED_USER" /var/www/redmine/config/database.yml
sed -i "11c \ \ password: $RED_Pwd" /var/www/redmine/config/database.yml

#setup Rails
cd /var/www/redmine
gem install bundler
bundle install
rake generate_secret_token
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake redmine:load_default_data

#Activate FCGI
cd /var/www/redmine/public
mkdir plugin_assets
cp dispatch.fcgi.example dispatch.fcgi
cp htaccess.fcgi.example .htaccess

#setting up Apache & FastCGI
cd /var/www/
rpm --import https://fedoraproject.org/static/0608B895.txt
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm
yum -y install mod_fcgid
rm -rf epel-release-6-8.noarch.rpm

#Creating Files Directory
mkdir -p /opt/redmine/files
chown -R apache:apache /opt/redmine
cd /var/www/redmine/config

#--setup configuration.yml
echo "Please enter your email address:"
read EmailAddress
sed -i '21a production: \
\ \ email_delivery: \
\ \ \ \ delivery_method:  :smtp \
\ \ \ \ smtp_settings: \
\ \ \ \ \ address: "mailrelay.trend.com.tw" \
\ \ \ \ \ port: 25' /var/www/redmine/config/configuration.yml

echo "Create a new file redmine.conf"

cat <<EOF > /etc/httpd/conf.d/redmine.conf
<VirtualHost *:80>
        ServerName $domain_name
        ServerAdmin $domain_name@domain.com
        DocumentRoot /var/www/redmine/public/
        ErrorLog logs/redmine_error_log
        <Directory "/var/www/redmine/public/">
                Options Indexes ExecCGI FollowSymLinks
                Order allow,deny
                Allow from all
                AllowOverride all
        </Directory>
</VirtualHost>
EOF

#running redmine
cd /var/www
chown -R apache:apache redmine
chmod -R 755 redmine
service httpd restart

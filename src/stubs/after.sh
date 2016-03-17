#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

#Kind of a nuclear option, but will allow you to use the VM DB with Craft
#See https://craftcms.stackexchange.com/questions/12084/getting-this-sql-error-group-by-incompatible-with-sql-mode-only-full-group-by/12106#comment17942_12106
echo 'sql_mode=""' >> /etc/mysql/my.cnf

#Server Tweaks
config='/etc/php5/fpm/php.ini'
sudo sed -i 's/memory_limit = .*/memory_limit = 512m/' $config
sudo sed -i 's/; max_input_vars = .*/max_input_vars = 6000/' $config

#You don't really need Ruby for dev, but it's a longer story than a comment can allow
#it doesn't really matter the version since it's not very Ruby intense
sudo apt-get install ruby
sudo gem install bundler

#Homestead has a redis server, but it expects you to use Laravel's Redis clien (I think?)
sudo apt-get install php5-redis

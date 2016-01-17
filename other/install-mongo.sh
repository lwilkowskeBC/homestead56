#!/bin/bash

echo "\n\n\n------------------------------------------------------------------------------------------------------------------------\n"
echo "----- INSTALLING MONGO SERVICE --------------------------------------------------------------------------------------------\n"
echo "------------------------------------------------------------------------------------------------------------------------\n\n"

ssh -t vagrant@192.168.10.10 'sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927;echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list;sudo apt-get update;sudo apt-get install -y mongodb-org;sudo service mongod start;chkconfig mongod on'

echo "\n\n\n------------------------------------------------------------------------------------------------------------------------\n"
echo "----- INSTALLING MONGO PHP DRIVER -----------------------------------------------------------------------------------------\n"
echo "------------------------------------------------------------------------------------------------------------------------\n\n"

ssh -t vagrant@192.168.10.10 'echo "pecl install mongo; echo -e \"\n\nextension=mongo.so\" >> /etc/php5/cli/php.ini; echo -e \"\n\nextension=mongo.so\" >> /etc/php5/fpm/php.ini; service nginx restart; service php5-fpm restart" > install_mongo.sh; sudo bash install_mongo.sh; rm install_mongo.sh'


echo "\n\n\n Complete!"

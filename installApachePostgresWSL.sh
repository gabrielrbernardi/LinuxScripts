#installing dependencies
sudo apt-get remove php* -y && 
sudo apt-get update -y &&
sudo add-apt-repository ppa:ondrej/php -y &&
sudo apt install apache2 php7.4 php7.4-fpm -y && 
sudo apt-get install php7.4-mysql php7.4-pdo php7.4-pgsql php7.4-curl php7.4-mbstring -y &&
sudo service php7.4-fpm start &&
##sudo systemctl start php7.4-fpm
sudo a2enmod proxy_fcgi proxy && 
sudo apt install libpq-dev -y &&
sudo service apache2 start &&

#changing directory to update files
wget https://raw.githubusercontent.com/gabrielrbernardi/LinuxScripts/main/apache2.conf && 
wget https://raw.githubusercontent.com/gabrielrbernardi/LinuxScripts/main/000-default.conf && 
wget https://raw.githubusercontent.com/gabrielrbernardi/LinuxScripts/main/php.ini && 
mv apache2.conf /etc/apache2/ &&
mv 000-default.conf /etc/apache2/sites-available/ && 
mv php.ini /etc/php/7.4/fpm/ && 

#cd /etc/apache2 && 
#restarting services and preparing environment
sudo service apache2 stop && sudo service apache2 start
mv /mnt/c/projetoatk/{.,}* /var/www/html/ -R &&
chmod 777 /var/www/html -R &&
chown www-data:www-data /var/www/html -R &&
sudo service apache2 stop && sudo service apache2 start

echo "Finalizando Configuracao"

#installing dependencies
sudo apt-get remove php* -y && 
sudo apt-get update -y &&
sudo add-apt-repository ppa:ondrej/php -y &&
sudo apt install apache2 php7.4 php7.4-fpm -y && 
sudo apt-get install php7.4-mysql php7.4-pdo php7.4-pgsql php7.4-curl -y &&
# sudo service php7.4-fpm start &&
sudo systemctl enable php7.4-fpm &&
sudo systemctl start php7.4-fpm &&
sudo a2enmod proxy_fcgi proxy && 
sudo apt install libpq-dev -y &&
# sudo service apache2 start &&
sudo systemctl enable apache2 &&
sudo systemctl start apache2 &&

#Updating configs of apache2
wget https://raw.githubusercontent.com/gabrielrbernardi/LinuxScripts/main/apache2.conf && 
wget https://raw.githubusercontent.com/gabrielrbernardi/LinuxScripts/main/000-default.conf && 
wget https://raw.githubusercontent.com/gabrielrbernardi/LinuxScripts/main/php.ini && 
mv apache2.conf /etc/apache2/ &&
mv 000-default.conf /etc/apache2/sites-available/ && 
mv php.ini /etc/php/7.4/fpm/ &&

sudo service apache2 stop && sudo service apache2 start

#installing postgresql
echo "Instalando Postgresql"
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install postgresql-14

wget https://raw.githubusercontent.com/gabrielrbernardi/LinuxScripts/main/custom_pg_hba.conf && 
sudo cat custom_pg_hba.conf >> /etc/postgresql/14/main/pg_hba.conf &&
sudo systemctl stop postgresql && sudo systemctl start postgresql

sudo service apache2 stop && sudo service apache2 start

echo "Finalizando Configuracao"
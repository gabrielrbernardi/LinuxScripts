sudo apt-get install git && 
cd /mnt/c &&
mkdir php &&
cd php &&
sudo apt install php-cli &&
php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php &&
php composer-setup.php && 
mv composer.phar composer &&
chmod +x composer && 
sudo mv composer /usr/local/bin/composer && #Movendo composer de lugar para facilitar a execução
git clone https://github.com/Sintattica/atk-skeleton.git conference && #Clonagem de projeto de exemplo
cd conference && 
sudo apt install docker.io &&
sudo apt install docker-compose

echo "Finalizando Instalacao"

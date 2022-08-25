#!/bin/bash

echo "Configurando needrestart..."
sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf

echo "Atualizando Ubuntu..."
apt-get update
apt-get -y upgrade

echo "Instalando apache2 e unzip..."
apt-get -y install apache2 unzip

echo "Baixando e descompactando aplicação..."
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -O /tmp/main.zip
unzip /tmp/main.zip -d /tmp

echo "Copiando arquivos da aplicacao para diretorio padrao do Apache..."
cp -rf /tmp/linux-site-dio-main/* /var/www/html/

echo "FIM!!!"
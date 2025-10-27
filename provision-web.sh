#!/usr/bin/env bash
set -e
export DEBIAN_FRONTEND=noninteractive

# Paquetes base
apt-get update -y
apt-get install -y apache2 php libapache2-mod-php php-pgsql rsync

# Asegurar Apache habilitado y funcionando
systemctl enable apache2
systemctl restart apache2

# Desplegar contenido desde carpeta compartida /vagrant/www a /var/www/html
mkdir -p /var/www/html
if [ -d /vagrant/www ]; then
  rsync -a --delete /vagrant/www/ /var/www/html/
fi

# Permisos recomendados
chown -R www-data:www-data /var/www/html
chmod -R 0755 /var/www/html

echo "[WEB] Apache+PHP (con php-pgsql) listos. Sitio desplegado en /var/www/html"

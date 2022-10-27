#!/bin/bash
# Instals Ioncube on all  existing and supported php versions

source /etc/hestiacp/hestia.conf

arc=$(arch)
if [ $arc = "x86_64" ]; then
 arc="x86-64"
fi

url="https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_$arc.tar.gz"

wget $url -O - | tar -xz

for php_version in $($HESTIA/bin/v-list-sys-php plain); do
        if [ ! -f "./ioncube/ioncube_loader_lin_$php_version.so" ]; then 
                echo "PHP$php_version is currently not supported"
                continue
        fi
        extension_dir=$(/usr/bin/php$php_version -i | grep extension_dir | cut -d' ' -f5);

        cp ./ioncube/ioncube_loader_lin_$php_version* $extension_dir
        echo "zend_extension=ioncube_loader_lin_$php_version.so" > /etc/php/$php_version/fpm/conf.d/00-ioncube-loader.ini
        echo "zend_extension=ioncube_loader_lin_$php_version.so" > /etc/php/$php_version/cli/conf.d/00-ioncube-loader.ini
        $HESTIA/bin/v-restart-service  php$php_version-fpm
        echo "PHP $php_version successfully updated"
done

rm -fr ioncube


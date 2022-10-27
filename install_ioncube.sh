#!/bin/bash
# Instals Ioncube on all  existing and supported php versions

source /etc/hestiacp/hestia.conf

# Look up what version is used x86_64 needs to become x86-64 instead
# Only tested for aarch and x86_64
arc=$(arch)
if [ $arc = "x86_64" ]; then
 arc="x86-64"
fi

# Download url
url="https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_$arc.tar.gz"
wget $url -O - | tar -xz

for php_version in $($HESTIA/bin/v-list-sys-php plain); do
        # Check if ioncube version is supported for example 8.0 is not availble!
        if [ ! -f "./ioncube/ioncube_loader_lin_$php_version.so" ]; then 
                echo "PHP$php_version is currently not supported"
                continue
        fi
        # Get extension dir and don't depend on user input
        extension_dir=$(/usr/bin/php$php_version -i | grep extension_dir | cut -d' ' -f5);
 
        # Copy ioncube file to extension dir 
        cp ./ioncube/ioncube_loader_lin_$php_version* $extension_dir
        
        # Add to conf.d folder for php-fpm and cli
        echo "zend_extension=ioncube_loader_lin_$php_version.so" > /etc/php/$php_version/fpm/conf.d/00-ioncube-loader.ini
        echo "zend_extension=ioncube_loader_lin_$php_version.so" > /etc/php/$php_version/cli/conf.d/00-ioncube-loader.ini
        # restart version
        $HESTIA/bin/v-restart-service  php$php_version-fpm
        echo "PHP $php_version successfully updated"
done

#clean up the trash
rm -fr ioncube


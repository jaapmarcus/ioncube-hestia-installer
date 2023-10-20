# ioncube-hestia-installer

Run in terminal / login via ssh and run as root!

```
wget https://raw.githubusercontent.com/jaapmarcus/ioncube-hestia-installer/main/install_ioncube.sh
chmod +x install_ioncube.sh
./install_ioncube.sh
```

Will install both php-fpm and cli

## Suported PHP versions

- php8.2
- php8.1
- php7.4
- php7.3
- php7.2
- php7.1
- php7.0
- php5.6

If IonCube decides to ad a new version as supported it should be included by default. This list might be behind the current supported php versions. 

Note: PHP8.0 is currently not supported and will not recive any support by Ioncube. 
https://blog.ioncube.com/2022/08/12/ioncube-php-8-1-support-faq-were-almost-ready/

## Older installs of Ioncube

If you have an older version all ready installed that is installed other ways than this method remove them first.

## Update IonCube / Add new PHP versions

If an install has been made with this script before it is save enough to run this system again. 



## ModPHP (Old Apache2 default before 1.2.0)

If you are still using modphp use:
```
echo "zend_extension=ioncube_loader_lin_$php_version.so" > /etc/php/$php_version/apache2conf.d/00-ioncube-loader.ini
```

And restart apache2 via v-restart-web

Was it usefull please send a [donation to Hestiacp](https://www.paypal.com/donate/?cmd=_s-xclick&hosted_button_id=ST87LQH2CHGLA)

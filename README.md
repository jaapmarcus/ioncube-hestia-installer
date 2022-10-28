# ioncube-hestia-installer

Run in terminal / login via ssh and run as root!

```
wget https://raw.githubusercontent.com/jaapmarcus/ioncube-hestia-installer/main/install_ioncube.sh
chmod +x install_ioncube.sh
./install_ioncube.sh
```

Will install both php-fpm and cli

If you are still using modphp use:
```
echo "zend_extension=ioncube_loader_lin_$php_version.so" > /etc/php/$php_version/apache2conf.d/00-ioncube-loader.ini
```

And restart apache2 via v-restart-web

Was it usefull please send a [donation to Hestiacp](https://www.paypal.com/donate/?cmd=_s-xclick&hosted_button_id=ST87LQH2CHGLA)

#!/bin/bash

# Expand ENV variables
envsubst '\$FPM_PORT' < /etc/php/7.2/fpm/pool.d/www.conf > /etc/php/7.2/fpm/pool.d/www.conf

# Start supervisord and services
/usr/local/bin/supervisord -n -c /etc/supervisord.conf

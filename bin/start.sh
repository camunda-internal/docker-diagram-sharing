#!/bin/bash

/etc/init.d/lighttpd start
tail -f /var/log/lighttpd/*
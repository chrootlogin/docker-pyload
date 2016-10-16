#!/bin/sh

if [ ! -f "/config/setup.lock" ]
then
        mkdir -p /config
        chmod 777 /config

        mv /tmp/pyload-config/* /config/
fi

if [ -f "/config/pyload.pid" ]
then
        rm /config/pyload.pid
fi

exec su - pyload -c "/opt/pyload/pyLoadCore.py --configdir=/config"

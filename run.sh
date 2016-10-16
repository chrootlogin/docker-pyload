#!/bin/sh

if [ ! -f "/config/setup.lock" ]
then
        mkdir -p /config
        chmod 777 /config

        mv -v /tmp/pyload-config/* /config/
fi

if [ -f "/config/pyload.pid" ]
then
        rm /config/pyload.pid
fi

exec /opt/pyload/pyLoadCore.py --configdir=/config

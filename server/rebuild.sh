#!/bin/bash

cd fwknop

if command -v fwknopd >/dev/null 2>&1; then
    make uninstall
fi

libtoolize --force && aclocal && autoheader && automake --force-missing --add-missing && autoconf
./configure --disable-client --prefix=/usr --sysconfdir=/etc && make && make install

cd - && cp ./config/totp_access.conf /etc/fwknop/access.conf

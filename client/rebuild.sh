#!/bin/bash

cd fwknop

if command -v fwknop >/dev/null 2>&1; then
    make uninstall
fi

libtoolize --force && aclocal && autoheader && automake --force-missing --add-missing && autoconf
./configure --disable-server --prefix=/usr --sysconfdir=/etc && make && make install

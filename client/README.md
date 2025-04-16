# fwknop client
Temporary workaround for compiling the client with the `openssl` library.

```bash
git clone https://github.com/ricoandreaslepp/fwknop-totp fwknop
cd fwknop && libtoolize --force && aclocal && autoheader && automake --force-missing --add-missing && autoconf
CFLAGS="-lssl -lcrypto" ./configure --disable-server --prefix=/usr --sysconfdir=/etc && make && make install
```

Then it is possible to send an SPA packet that uses the simulated TOTP key:

```bash
fwknop -n spa-server --rc-file /client/.fwknoprc --totp -vv
```

If the `KEY_BASE64` parameter is set in the `.fwknoprc` configuration file, then currently this overrides the TOTP secret.
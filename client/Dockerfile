FROM ubuntu:latest

WORKDIR /client

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y make automake curl git net-tools conntrack openssl libssl-dev libjson-c-dev libpcap-dev texinfo libtool autoconf libuv1 libuv1-dev nmap
# RUN apt-get install -y fwknop-client

# Install fwknop client
# RUN git clone https://github.com/ricoandreaslepp/fwknop-totp fwknop
# RUN cd fwknop && libtoolize --force && aclocal && autoheader && automake --force-missing --add-missing && autoconf
# RUN cd fwknop && CFLAGS="-lssl -lcrypto" ./configure --disable-server --prefix=/usr --sysconfdir=/etc && make && make install

# Copy configuration files
COPY . .
RUN chmod +x ./test.sh ./rebuild.sh
RUN chmod 0600 .fwknoprc

# Add IP to configuration file
RUN sed -i "s/CLIENT_IP/172.17.0.2/" .fwknoprc
RUN sed -i "s/SERVER_IP/172.17.0.3/" .fwknoprc

CMD ["/bin/bash", "-c", "sleep infinity"]

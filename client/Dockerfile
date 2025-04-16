FROM ubuntu:latest

WORKDIR /client

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y make automake curl git net-tools conntrack openssl libssl-dev libjson-c-dev libpcap-dev texinfo libtool autoconf libuv1 libuv1-dev nmap
# RUN apt-get install -y fwknop-client

# Install fwknop client
RUN git clone https://github.com/ricoandreaslepp/fwknop-totp fwknop
RUN cd fwknop && libtoolize --force && aclocal && autoheader && automake --force-missing --add-missing && autoconf
RUN cd fwknop && ./configure --disable-server --prefix=/usr --sysconfdir=/etc && make && make install

# Copy configuration files
COPY . .
RUN chmod 0600 .fwknoprc
RUN chmod +x test.sh

CMD ["/bin/bash", "-c", "sleep infinity"]

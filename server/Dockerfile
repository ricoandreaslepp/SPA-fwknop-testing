FROM ubuntu:latest

EXPOSE 4444

WORKDIR /gateway

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

USER root

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y make automake curl git net-tools conntrack openssl libssl-dev libjson-c-dev libpcap-dev texinfo libtool autoconf libuv1 libuv1-dev
RUN apt-get install -y iptables

# Install fwknop server
# RUN git clone https://github.com/ricoandreaslepp/fwknop-totp fwknop
# RUN cd fwknop && libtoolize --force && aclocal && autoheader && automake --force-missing --add-missing && autoconf
# RUN cd fwknop && ./configure --disable-client --prefix=/usr --sysconfdir=/etc && make && make install

# Copy configuration files
COPY . .
RUN chmod +x ./run.sh ./rebuild.sh

CMD ["/bin/bash","-c", " ./run.sh"]

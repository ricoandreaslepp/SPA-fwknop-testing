FROM ubuntu:latest

WORKDIR /client

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y make automake curl git net-tools conntrack openssl libssl-dev libjson-c-dev libpcap-dev texinfo libtool autoconf libuv1 libuv1-dev nmap
RUN apt-get install -y fwknop-client

# Copy configuration files
COPY . .
RUN chmod 0600 .fwknoprc
RUN chmod +x test.sh

CMD ["/bin/bash", "-c", "sleep infinity"]

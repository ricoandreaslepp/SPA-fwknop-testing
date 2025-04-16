# SPA-fwknop-testing
Single Packet Authorization (SPA) using the `fwknop` implementation inside a Docker Compose environment.

---

![SPA-Example](docs/rsz_spa.png)

---

## 1. Usage

```bash
$ docker compose up -d --build
# for development only rebuild the server
$ docker compose up -d --build spa-server
```

We can now check that the port is closed from the client:

```bash
$ docker container exec -it spa-client /bin/bash
> nmap -p22 spa-server
```

After sending a valid SPA packet, we can connect:

```bash
# manually
$ fwknop -A tcp/22 -a 172.21.0.2 -D 172.21.0.3 --key-base64-hmac=c0TOaMJ2aVPdYTh4Aa25Dwxni7PrLo2zLAtBoVwSepkvH6nLcW45Cjb9zaEC2SQd03kaaV+Ckx3FhCh5ohNM5Q== --key-base64-rijndael=Sz80RjpXOlhH2olGuKBUamHKcqyMBsS9BTgLaMugUsg= --verbose
# authenticate with the .fwknoprc file
$ fwknop --rc-file /client/.fwknoprc -n spa-server
$ ssh root@spa-server
```

## 2. Setting up new keys

#### 2.1. Generate the SPA keys

First, generate the Base64 keys on the client:

```bash
$ docker exec -it spa-client /bin/bash
> fwknop -A [SERVICES (tcp/80, tcp/22)] --use-hmac -R -D [SERVER_IP] --key-gen --save-rc-stanza --verbose
```

Then, copy the `KEY_BASE64` and the `HMAC_KEY_BASE64` to the server `access.conf` file.

#### 2.2. Start the client access request

First, replace the `[Gateway IP]` on the `/root/.fwknoprc` file with the gateway IP.

Then, run the following command to request access to the server:

```bash
$ docker exec -it spa-client /bin/bash
> fwknop -n [SERVER_IP] --wget-cmd /usr/bin/wget -a [CLIENT_IP]
```
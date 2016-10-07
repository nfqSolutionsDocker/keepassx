### development-java

This container has the following characteristics:
- Container nfqsolutions/centos:7.
- Install keepassx
- The default keepassx directory is /solutions/app
- There is a Installations Script. This script copy directories to volumen. This script is executing in the next containers or in the docker compose.

For example, docker-compose.yml:
```
app:
 image: nfqsolutions/keepass:latest
 restart: always
 ports:
  - "<PORT_B>:22"
 environment:
  - PACKAGES=
 volumes:
  - <mydirectory>:/solutions/app
```

For execute eclipse:
```
ssh root@<MACHINE_IP> -p<PORT_B> keepassx2
```
# Docker for Weblogic with domain

### Description

This is Oracle Weblogic 12.2.1.2 Docker image

### Run

Go to compose folder and run

```bash
docker-compose up -d
```

### Run step by step

#### 1. create bridge network

```bash
docker network create -d bridge weblogic
```

#### 2. Run AdminServer

```bash
docker run -d -p 8001:8001 --net weblogic --name=wlsadmin playniuniu/weblogic-domain:12.2.1.2
```

You can login your web with [http://127.0.0.1:8001/console](http://127.0.0.1:8001/console)

![](http://ww3.sinaimg.cn/large/72f96cbajw1f9aqql2zm3j21kw0u1n5h.jpg)

Login using **weblogic/welcome1** and verify that only one server (Admin Server) exists.

![](http://ww2.sinaimg.cn/large/72f96cbajw1f9aqr5bvaqj21kw114wr5.jpg)

#### Run ManagedServer

```bash
docker run -d --net weblogic -p 7001:7001 -e MS_NAME=ManageServer-01 playniuniu/weblogic-domain:12.2.1.2 create-managed.sh

docker run -d --net weblogic -p 7002:7001 -e MS_NAME=ManageServer-02 playniuniu/weblogic-domain:12.2.1.2 create-managed.sh
```

Login to [AdminServer](http://127.0.0.1:8001/console) and notice that a new Managed Server has been created and it is up and running. 

### Other

I also build a AdminServer image with sshd, you can check it [playniuniu/weblogic-sshd](https://hub.docker.com/r/playniuniu/docker-weblogic-sshd/)

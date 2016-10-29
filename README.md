# Docker for Weblogic with domain

### Description

This docker is follow the guide from [Oracle Weblogic Docker](https://github.com/oracle/docker-images/tree/master/OracleWebLogic) and [Workshop intro](https://github.com/oracle/docker-images/tree/master/OracleWebLogic/workshops/intro)

I have already build the image [centos-serverjre](https://hub.docker.com/r/playniuniu/centos-serverjre/) and [weblogic-base](https://hub.docker.com/r/playniuniu/weblogic-base/) for this image

You can follow the github there for build you own weblogic image

### Start Weblogic AdminServer

```bash
docker run -d -p 8001:8001 --name=wlsadmin playniuniu/weblogic-domain:12.2.1.2 startWebLogic.sh
```

You can login your web with [http://127.0.0.1:8001/console](http://127.0.0.1:8001/console)

![](images/15_dockerinspect2.png)

Login using weblogic/welcome1 and verify that only one server (Admin Server) exists.

![](images/16_console.png)

### Other Weblogic Type

This container also can start other weblogic server type

1. Start NodeManager (Manually):

	```bash
	docker run -d --link wlsadmin:wlsadmin playniuniu/weblogic-domain:12.2.1.2 startNodeManager.sh
	```


2. Start NodeManager and Create a Machine Automatically:

	```bash
	docker run -d --link wlsadmin:wlsadmin playniuniu/weblogic-domain:12.2.1.2 createMachine.sh
	```

3. Start NodeManager, Create a Machine, and Create a ManagedServer Automatically

	```bash
	docker run -d --link wlsadmin:wlsadmin playniuniu/weblogic-domain:12.2.1.2 createServer.sh
	```

The parameters you can use listed below:

	docker run -d --link wlsadmin:wlsadmin \
	-p <NM Port>:5556 -p <MS Port>:<MS Port> \
	--name=<Container name> \
	-e MS_HOST=<Host address where Managed server container runs> \
	-e MS_PORT=<Managed server port, use same unique port internally and externally> \
	-e NM_HOST=<Host address where NM container runs> \
	-e NM_PORT=<NM Port (should match the externally exposed port with -p)> \
	<image name based on 12c-domain sample> \
	<createMachine.sh, startNodeManager.sh, createServer.sh>
	
### Start Weblogic ManagedServer

Let's start managed server use 3rd comand

```bash
docker run -d --link wlsadmin:wlsadmin playniuniu/weblogic-domain:12.2.1.2 createServer.sh
```

Login to [AdminServer](http://127.0.0.1:8001/console) and notice that a new Managed Server has been created and it is up and running on port 7001. 

![](images/20_console.png)
 
Click on Machines and notice that a new Machine has also been created:

![](images/21_consolemachines.png)
 
Click on the newly created Machine and then verify the NodeManager Configuration. A new Nodemanager has been created and started

![](images/22_consolenodemanager.png)

 
### More Information

- [Oracle WebLogic Server 12.2.1 Running on Docker Containers ](https://blogs.oracle.com/WebLogicServer/entry/oracle_weblogic_server_12_21)

- [White Paper - Oracle  WebLogic Server on Docker Containers](http://www.oracle.com/technetwork/middleware/weblogic/overview/weblogic-server-docker-containers-2491959.pdf)

- [Docker on Oracle Linux](https://docs.docker.com/engine/installation/linux/oracle/)


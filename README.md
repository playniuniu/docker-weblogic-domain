# Docker for Weblogic with domain

### Description

This docker is follow the guide from [Oracle Weblogic Docker](https://github.com/oracle/docker-images/tree/master/OracleWebLogic) and [Workshop intro](https://github.com/oracle/docker-images/tree/master/OracleWebLogic/workshops/intro)

I have already build the image [centos-serverjre](https://hub.docker.com/r/playniuniu/centos-serverjre/) and [weblogic-base](https://hub.docker.com/r/playniuniu/weblogic-base/) for this image

You can follow the code there for build you own weblogic image

### Start Weblogic AdminServer

```bash
docker run -d -p 8001:8001 --name=wlsadmin playniuniu/weblogic-domain:12.2.1.2 startWebLogic.sh
```

You can login your web with [http://127.0.0.1:8001/console](http://127.0.0.1:8001/console)

![](http://ww3.sinaimg.cn/large/72f96cbajw1f9aqql2zm3j21kw0u1n5h.jpg)

Login using **weblogic/welcome1** and verify that only one server (Admin Server) exists.

![](http://ww2.sinaimg.cn/large/72f96cbajw1f9aqr5bvaqj21kw114wr5.jpg)

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
	
### Start Weblogic ManagedServer

Run the command below:

```bash
docker run -d --link wlsadmin:wlsadmin playniuniu/weblogic-domain:12.2.1.2 createServer.sh
```

Login to [AdminServer](http://127.0.0.1:8001/console) and notice that a new Managed Server has been created and it is up and running on port 7001. 

![](http://ww4.sinaimg.cn/large/72f96cbajw1f9aqr4thh2j21kw1147i6.jpg)
 
Click on Machines and notice that a new Machine has also been created:

![](http://ww2.sinaimg.cn/large/72f96cbajw1f9aqr4d8uoj21kw0z7qfo.jpg)
 
Click on the newly created Machine and then verify the NodeManager Configuration. A new Nodemanager has been created and started

![](http://ww4.sinaimg.cn/large/72f96cbajw1f9aqr49kgrj21kw0zcwv9.jpg)


### Other

I also build a AdminServer image with sshd, you can check it [playniuniu/weblogic-sshd](https://hub.docker.com/r/playniuniu/docker-weblogic-sshd/)

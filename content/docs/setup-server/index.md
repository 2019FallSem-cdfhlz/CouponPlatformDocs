---
title: 服务端Docker环境搭建
date: 2019-11-28T14:38:08+08:00
---

本文主要说明了如何通过命令行搭建服务端的容器集群，不涉及Docker Compose。<!--more-->

一般情况下，按顺序执行本文中的命令即可，无需切换当前目录，需要切换目录的地方都有对应的`cd`命令。

### 镜像准备

搭建集群需要用到Node.js和MongoDB的镜像。其中，Node.js使用12.13.1 LTS版本，保证稳定性；MongoDB使用最新的4.2.1版本，如有需要可以调整。

执行以下命令从 Docker Hub 拉取镜像：

```shell
docker image pull node:12.13.1-alpine3.10
docker image pull mongo:4.2.1-bionic
```

Node.js镜像选用了基于Alpine 3.10系统构建的，比较轻量；MongoDB则是基于Ubuntu 18.04 （代号Bionic），与运行环境保持一致。

### 容器网络

容器间通信依靠Docker network来实现，创建一个名为`coupon-net`的网络：

```shell
docker network create -d bridge coupon-net
```

### 拉取服务端代码

```shell
git clone https://github.com/2019FallSem-cdfhlz/CouponPlatform.git sem
```

### 启动MongoDB容器

```shell
cd sem && \
mkdir -p data/db && mkdir data/configdb && \
docker run -d --rm --name coupon-db --network coupon-net \
	--mount type=bind,source=$(pwd)/data/db,target=/data/db \
	--mount type=bind,source=$(pwd)/data/configdb,target=/data/configdb \
	mongo:4.2.1-bionic
```

该命令将容器命名为`coupon-db`，将其加入`coupon-net`网络中，并挂载了仓库根目录下的`data/db`和`data/configdb`进入该容器，作为数据存储层。

容器以后台方式启动，如果要查看其输出，可使用`docker logs coupon-db`。

#### TODO

关于MongoDB的配置可能还需要进一步细化，按照默认配置启动容器报了一个Warning：

```shell
** WARNING: Using the XFS filesystem is strongly recommended with the WiredTiger storage engine
**          See http://dochub.mongodb.org/core/prodnotes-filesystem
```

### 启动Node.js容器

启动Node.js容器之前首先需要修改服务端连接数据库的配置，操作方法如下：

1. `vim server/src/config.js`
2. 按`i`键，进入编辑模式，移动上下左右方向键，定位到`module.exports`的`db`字段
3. 将`localhost`修改为`coupon-db`
4. 按下`esc`键，输入`:wq`保存退出

然后启动Node.js容器：

```shell
docker run -itd --rm --name coupon-server -p 3000:3000 \
	--mount type=bind,source=$(pwd)/server,target=/server \
	--network coupon-net \
	node:12.13.1-alpine3.10 /bin/sh -c "cd /server && npm i && node bin/www"
```

该容器同样以后台方式启动，要查看其输出，可使用`docker logs coupon-server`。

> 如果启动后发现有报错，请参看仓库主页[README](https://github.com/2019FallSem-cdfhlz/CouponPlatform/blob/master/README.md)的Troubleshooting一节。

### 终止容器

以下命令可以终止容器的运行：

```shell
docker container stop coupon-server
docker container stop coupon-db
```

或者一条命令结束所有和coupon有关的容器：

```shell
docker container stop $(docker container ls -aqf name=coupon)
```


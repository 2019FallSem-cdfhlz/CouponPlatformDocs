---
title: '安装 Docker'
date: 2019-11-24T20:24:38+08:00
weight: 2
---

## Ubuntu 18.04 Docker 环境配置

本文基于Docker官方文档，按照步骤操作应该能确保正确安装Docker 19.03。<!--more-->

### 预备工作

- 安装了Ubuntu 18.04 的主机一台（物理机/虚拟机均可），官方镜像在[这里](https://ubuntu.com/download/desktop/thank-you?country=US&version=18.04.3&architecture=amd64)下载

### 安装步骤

按照以下顺序执行命令即可：

1. 更新系统软件

    ```shell
    sudo apt-get update
    sudo apt-get upgrade
    ```

2. 配置APT

    ```shell
    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    ```

3. 添加 Docker 官方的 GPG 密钥：

    ```shell
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    ```

    验证一下获得的密钥：

    ```shell
    $ sudo apt-key fingerprint 0EBFCD88
    # 输出应如下
    pub   rsa4096 2017-02-22 [SCEA]
        9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
    uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
    sub   rsa4096 2017-02-22 [S]
    ```

4. 添加 Docker 仓库：

    ```shell
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    ```

5. 安装指定版本的 Docker 引擎

    ```shell
    sudo apt-get install docker-ce=5:19.03.5~3-0~ubuntu-bionic docker-ce-cli=5:19.03.5~3-0~ubuntu-bionic containerd.io=1.2.10-3
    ```

6. 测试是否安装成功

    ```shell
    sudo docker run hello-world
    ```

    输出应该如下：

    ```shell
    Unable to find image 'hello-world:latest' locally
    latest: Pulling from library/hello-world
    1b930d010525: Pull complete 
    Digest: sha256:c3b4ada4687bbaa170745b3e4dd8ac3f194ca95b2d0518b417fb47e5879d9b5f
    Status: Downloaded newer image for hello-world:latest

    Hello from Docker!
    This message shows that your installation appears to be working correctly.

    To generate this message, Docker took the following steps:
    1. The Docker client contacted the Docker daemon.
    2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
        (amd64)
    3. The Docker daemon created a new container from that image which runs the
        executable that produces the output you are currently reading.
    4. The Docker daemon streamed that output to the Docker client, which sent it
        to your terminal.

    To try something more ambitious, you can run an Ubuntu container with:
    $ docker run -it ubuntu bash

    Share images, automate workflows, and more with a free Docker ID:
    https://hub.docker.com/

    For more examples and ideas, visit:
    https://docs.docker.com/get-started/

    ```

**安装完成。**
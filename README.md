# 概述

本项目作为docker的示例，旨在通过将一个简单的web程序构建为一个基于docker的项目，方便后续更换设备导致的各种繁琐的环境搭建和迁移。

除了代码，更多说明可查看注释。

# 环境

## mac-os

- docker

```
$ brew cask install docker
```

- docker-compose

```
$ pip install docker-componse
```

## 其它

# 部署

通过docker-compose实现自动化地环境部署。

## 基本命令

进入工程的目录中，可执行docker-compose命令，其会默认加载当前目录中的`docker-compose.yml`文件，也可以通过`-f`参数指定特定目录的配置文件。

### 构建、启动容器

```
$ docker-compose up
```

### 希望在后台守护执行

```
$ docker-compose up -d
```

### 查看当前所有镜像

```
$ docker image ls

REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
docker-example_web   latest              17933fa28f33        2 minutes ago       917MB
python               2.7.15              bfa54426aeda        4 days ago          912MB
redis                alpine              b42dc832c855        3 weeks ago         40.9MB
```

### 查看当前所有容器

```
$ docker container ls

CONTAINER ID        IMAGE                COMMAND                  CREATED             STATUS              PORTS                    NAMES
eec43c39eac9        redis:alpine         "docker-entrypoint.s…"   2 minutes ago       Up 6 seconds        6379/tcp                 redis-example
267f3b264ac0        docker-example_web   "python app.py"          2 minutes ago       Up 6 seconds        0.0.0.0:5000->5000/tcp   web-example
```

### 停止容器

```
$ docker-compose stop
```

#### 登录运行中的容器

```
docker exec -it 容器名称 sh
```

# 迁移

- export/save和load命令

```
$ docker export <CONTAINER ID> <CONTAINER ID> <CONTAINER ID> ... > /home/export.tar
$ docker load < /home/export.tar
```

- export和save的区别

>  导出后再导入(exported-imported)的镜像会丢失所有的历史，而保存后再加载（saved-loaded）的镜像没有丢失历史和层(layer)。这意味着使用导出后再导入的方式，你将无法回滚到之前的层(layer)，同时，使用保存后再加载的方式持久化整个镜像，就可以做到层回滚（可以执行docker tag <LAYER ID> <IMAGE NAME>来回滚之前的层。




# 参考

- https://blog.csdn.net/chinrui/article/details/79155688

- https://www.cnblogs.com/zhengah/p/4949276.html
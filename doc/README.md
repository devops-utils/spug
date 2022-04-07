```shell
sudo docker run -d --restart=always --name=spug -p 8032:80 -v $(pwd)/spug:/data registry.aliyuncs.com/openspug/spug
sudo docker exec spug init_spug admin spug.dev

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io
systemctl start docker

docker pull registry.aliyuncs.com/openspug/spug

# 持久化存储启动命令：
# /spug 指的是映射本地的磁盘路径，也可以是其他目录，/data是容器内代码和数据初始化存储的路径
docker run -d --restart=always --name=spug -p 80:80 -v /spug:/data registry.aliyuncs.com/openspug/spug

# 如果你需要在spug内使用docker命令则需要添加额外的参数
docker run -d --restart=always --name=spug -p 80:80 -v /spug/:/data -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker registry.aliyuncs.com/openspug/spug

docker exec spug init_spug admin spug.dev
```
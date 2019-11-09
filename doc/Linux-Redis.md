## Redis运维手册（Linux）

### 下载：

#### https://redis.io/download

#### http://download.redis.io/releases/redis-4.0.14.tar.gz

#### https://cloud.tencent.com/developer/article/1333876

#### https://blog.csdn.net/l_learning/article/details/89103360

### 安装

```
yum install -y gcc gcc-c++ make jemalloc-devel epel-release
wget http://download.redis.io/releases/redis-4.0.14.tar.gz
```

### 配置
```
tar -zxvf redis-4.0.14.tar.gz
cd /usr/local/redis/redis-4.0.14
make   （或make MALLOC=libc）
make PREFIX=/usr/local/redis install
```

### 启动
`./bin/redis-server`


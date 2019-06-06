## Linux下Nginx运维手册

### 下载


### 编译1
./configure --with-http_stub_status_module 、
--prefix=/usr/local/nginx \
--with-http_ssl_module \
--with-openssl \
--with-stream 
make
make install


### 编译2 (RTMP)

#### RTMP源码：https://github.com/arut/nginx-rtmp-module
```
./configure --with-http_stub_status_module \
  --prefix=/usr/local/nginx \
  --with-http_ssl_module \
  --with-openssl \
  --add-module=../nginx-rtmp-module

```

### 配置



### 启动

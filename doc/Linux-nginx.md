## Linux下Nginx运维手册

#### 官网：http://nginx.org/
#### 下载：http://nginx.org/en/download.html

### （1）编译1
```
./configure --with-http_stub_status_module 、
--prefix=/usr/local/nginx \
--with-http_ssl_module \
--with-openssl \
--with-stream 
make
make install
```

### （2）编译2 (RTMP)

#### RTMP源码：https://github.com/arut/nginx-rtmp-module
```
./configure --with-http_stub_status_module \
  --prefix=/usr/local/nginx \
  --with-http_ssl_module \
  --with-openssl \
  --add-module=../nginx-rtmp-module

```

### （3）配置
#### SSL配置
```
#nginx ssl
  listen 443 ssl;

	#ssl start：
       ssl_certificate ssl/xxxxxxxxxx.crt;
       ssl_certificate_key  ssl/xxxxxxxxxx.key;
       ssl_session_timeout  30m;
       ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
       ssl_ciphers  HIGH:!ADH:!EXPORT56:RC4+RSA:+MEDIUM;
  #ssl end
```


### （4）启动
#### 启动
`./sbin/nginx -t`

#### 重启
`./sbin/nginx -s reload`

#### 关闭
`kill -HUP 进程D`

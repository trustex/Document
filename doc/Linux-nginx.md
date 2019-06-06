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
#### 线程配置
```
worker_processes 1;
events {
    worker_connections 1024;
}
```
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

#### CDN 配置
##### 来源：https://blog.csdn.net/xiangxisheng/article/details/53491510
```
http {
    access_log off;
    client_body_temp_path temp/client_body_temp;
    fastcgi_temp_path temp/fastcgi_temp;
    scgi_temp_path temp/scgi_temp;
    uwsgi_temp_path temp/uwsgi_temp;
    proxy_temp_path temp/proxy_temp;

    proxy_set_header Host $http_host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Accept-Encoding "";
    proxy_set_header Connection "keep-alive";

    include mime.types;
    default_type application/octet-stream;
    sendfile on;
    keepalive_timeout 10;
    server {
        listen 80;
        location / {
            proxy_pass https://test:443;
        }
    }
    server {
        listen 443 ssl;
        ssl_certificate cert/test.crt;
        ssl_certificate_key cert/test.key;
        location / {
            proxy_pass https://test:443;
        }
    }
}
```


### （4）启动
#### 启动
`./sbin/nginx -t`

#### 重启
`./sbin/nginx -s reload`

#### 关闭
`kill -HUP 进程D`

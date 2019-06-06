## Linux下Nginx运维手册

#### 官网：http://nginx.org/
#### 下载：http://nginx.org/en/download.html

### （1）编译1
```
./configure --with-http_stub_status_module \
--prefix=/usr/local/nginx \
--with-http_ssl_module \
--with-openssl \
--with-stream 
make
make install
```

### （2）编译2 (RTMP)

#### RTMP模块源码：https://github.com/arut/nginx-rtmp-module
```
./configure --with-http_stub_status_module \
  --prefix=/usr/local/nginx \
  --with-http_ssl_module \
  --with-openssl \
  --add-module=../nginx-rtmp-module
make & make install
```

### （3）配置
#### 线程配置
```
worker_processes 1;
events {
    worker_connections 1024;
}
```

#### VHOST配置
```
upstream javasrv {
        server 127.0.0.1:81;
}

server {
       listen       80;
       listen 443 	ssl;

       #ssl start
       ssl_certificate ssl/domain.crt;
       ssl_certificate_key  ssl/domain.key;
       ssl_session_timeout  30m;
       ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
       ssl_ciphers  HIGH:!ADH:!EXPORT56:RC4+RSA:+MEDIUM;
       #ssl end
      
       server_name api.domain.com;

        location / {
                root   /usr/local/wwwroot/www;
                index  index.html index.htm index.php;
        }

        limit_conn perip 30;

        error_page  404              /self_error.html;
        error_page  416              /self_error.html;

        error_page   500 /500.html;
        error_page   502 /502.html;
        error_page   503 504  /50x.html;

        location = /error.html {
            root   html;
        }

        location = /500.html {
            root   html;
        }

        location = /502.html {
            root   html;
        }

        location = /50x.html {
            root   html;
        }

        location /api/ {
            proxy_pass   http://javasrv;
                       proxy_set_header   Host             $host;
                       proxy_set_header   X-Real-IP        $remote_addr;
                       proxy_set_header   X-Forwarded-For  $proxy_add_x_forwarded_for;
                                       client_max_body_size 10m;       
        }
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

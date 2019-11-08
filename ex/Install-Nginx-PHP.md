
### 系统要求
Centos 7.x

### 参考
#### https://blog.csdn.net/nouswait/article/details/83105378
#### https://www.cnblogs.com/vurtne-lu/p/7707536.html

### 脚本

### 1、Update System
```
yum install -y gcc gcc-c++ make sudo autoconf libtool-ltdl-devel gd-devel \
        freetype-devel libxml2-devel libjpeg-devel libpng-devel \
        openssl-devel curl-devel patch libmcrypt-devel \
        libmhash-devel ncurses-devel bzip2 \
        libcap-devel ntp sysklogd diffutils sendmail iptables unzip cmake

yum -y update
yum -y install gcc gcc-c++ autoconf automake zlib zlib-devel openssl openssl-devel pcre* make gd-devel libjpeg-devel libpng-devel libxml2-devel bzip2-devel libcurl-devel
```


### 2、Config MySQL 
请参见 [Install-MySQL](Install-MySQL.md)

### 3、Config Nginx
```
./configure \
            --prefix=/usr/local/nginx \
            --user=www \
            --group=www \
            --with-http_ssl_module \
            --with-http_v2_module \
            --with-http_stub_status_module \
            --with-pcre
```

### 4、Config PHP
```
./configure \
--prefix=/usr/local/php5 \
--with-config-file-path=/usr/local/php5/etc \
--with-bz2 \
--with-curl \
--enable-ftp \
--enable-sockets \
--disable-ipv6 \
--with-gd \
--with-jpeg-dir=/usr/local \
--with-png-dir=/usr/local \
--with-freetype-dir=/usr/local \
--enable-gd-native-ttf \
--with-iconv-dir=/usr/local \
--enable-mbstring \
--enable-calendar \
--with-gettext \
--with-libxml-dir=/usr/local \
--with-zlib \
--with-pdo-mysql=mysqlnd \
--with-mysqli=mysqlnd \
--with-mysql=mysqlnd \
--enable-dom \
--enable-xml \
--enable-fpm \
--with-libdir=lib64 \
--enable-bcmath
```

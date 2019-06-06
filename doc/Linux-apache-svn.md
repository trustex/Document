## Linux Svn 配置

#### 参考：https://blog.51cto.com/liuhuiliang/2096497

### 安装apr与apr-util
###### 下载这两个tar包，下载方式还是两种，直接运行wget或者点击网址下载，以下是两个依赖包的下载地址
```
wget http://mirror.bit.edu.cn/apache//apr/apr-1.5.2.tar.gz
wget http://mirrors.cnnic.cn/apache//apr/apr-util-1.5.4.tar.gz
```

### Apache2.x配置
```
./configure --prefix=/usr/local/webapp/apache82 \
--enable-modules=so \
--enable-dav --enable-maintainer-mode \
--enable-rewrite --enable-ssl \
--enable-vhost-alias --enable-cgi \
--with-apr=/usr --with-apr-util=/usr \
--with-ssl
make & make install
```

### subversion配置
```
wget http://mirrors.cnnic.cn/apache/subversion/subversion-1.9.4.tar.gz
tar zxvf subversion-1.9.4.tar.gz
cd subversion-1.9.4
./configure --prefix=/usr/local/svn/subversion \
  --with-apxs=/usr/local/webapp/apache82/bin/apxs \
  --with-apr=/usr --with-apr-util=/usr \
  --with-zlib \
  --enable-maintainer-mode
make  & make install

cp /usr/local/svn/subversion/libexec/mod_authz_svn.so /usr/local/webapp/apache82/modules/
cp /usr/local/svn/subversion/libexec/mod_dav_svn.so /usr/local/webapp/apache82/modules/

```

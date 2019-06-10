
## Linux系统运维手册/相关优化

#### Linux搭建Nexus2/Maven私服 https://blog.csdn.net/qq_36911145/article/details/82905299
#### Centos编译安装Apache/subversion1.9.7/httpd2.4.32 https://blog.51cto.com/liuhuiliang/2096497
#### Linux下使用Google Authenticator配置SSH登录动态验证码 https://www.cnblogs.com/caoshousong/p/10474710.html

### （1）磁盘分区
#### 分区
```
sudo fdisl -l #查看磁盘
sudo fdisk /dev/xxxxx
```
#### 格式化
`sudo mkfs.ext4 /dev/xxxx1`
#### 挂载(加到自启动rc.local文件)
`sudo mount /dev/xxxx1 /data`

### （2）交换分区建立
```
dd if=/dev/zero of=/opt/swap bs=1024 count=2048000 
#dd if=/dev/zero of=/opt/swap bs=1024 count=4096000 
#dd if=/dev/zero of=/opt/swap bs=1024 count=8192000 
#dd if=/dev/zero of=/opt/swap bs=1024 count=16384000
mkswap /opt/swap
swapon /opt/swap
```

### （3）文件上传下载
##### centos安装
`yum -y install lrzsz`

##### ubuntu安装
`sudo apt-get install lrzsz`

##### 源码安装
```
wget https://www.ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz
tar zxvf lrzsz-0.12.20.tar.gz
cd lrzsz-0.12.20
./configure --prefix=/usr/local/rz
make
make install
ln -s /usr/local/rz/bin/lrz /usr/local/rz/bin/rz
ln -s /usr/local/rz/bin/lsz /usr/local/rz/bin/sz
```

##### 服务端上传:
`rz -y`
##### 服务端下载：
`sz test.tar.gz`

### （4）ubuntu的Java环境变量配置
/etc/profile新增以下内容：
```
export JAVA_HOME=/usr/local/java8
export CLASSPATH=.:$JAVA_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$PATH
```

### （5）ulimit配置 (ulimit -a)
#### ulimit配置说明：https://blog.csdn.net/linucle/article/details/8450980
```
#/etc/security/limits.conf
#/etc/security/limits.d/20-nproc.conf
*          soft    nproc     65535
root       soft    nproc     unlimited

#*         soft    nofile    65535
#*         hard    nofile    65535
```

### （6）网络优化
#### 配置编辑
`vi /etc/sysctl.conf`
####  配置内容
```
#net.ipv4.tcp_tw_recycle=1
net.ipv4.tcp_tw_reuse=1
net.ipv4.tcp_syncookies=1
net.ipv4.tcp_fin_timeout=30
```
#### 然后执行
`/sbin/sysctl -p`

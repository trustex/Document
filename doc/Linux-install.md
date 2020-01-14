
## Linux系统运维手册/相关优化

#### Linux搭建Nexus2/Maven私服 https://blog.csdn.net/qq_36911145/article/details/82905299
#### Centos编译安装Apache/subversion1.9.7/httpd2.4.32 https://blog.51cto.com/liuhuiliang/2096497
#### Linux下使用Google Authenticator配置SSH登录动态验证码 https://www.cnblogs.com/caoshousong/p/10474710.html
#### Rsync https://www.cnblogs.com/JohnABC/p/6203524.html

### 常用包下载
#### JDK： http://ghaffarian.net/downloads/Java/
#### Centos下载：http://vault.centos.org/
#### 163.com下载：http://mirrors.163.com/
#### 阿里下载：https://opsx.alibaba.com/mirror

### 常用命令

#### 过滤注释行
'more www.conf |grep -v "^;"'

#### 查看版本
`cat /etc/issue`
#### 查看版本完整信息
`lsb_release -a`

#### 查看内核
`cat /proc/version`

#### 查看内核2
`uname -a`

#### 修改时间为 CTS
`sudo cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime`

```
、查看时区
centos7：
timedatectl|grep "Time zone"
centos6：
cat /etc/sysconfig/clock
2、修改时区
centos7：
timedatectl set-timezone Asia/Shanghai # 设置系统时区为上海
centos6：
修改文件：
/etc/sysconfig/clock 内容：
ZONE="Asia/Shanghai"
3、时间的修改
安装ntp软件：
yum install ntp -y
同步命令：
ntpdate asia.pool.ntp.org
如果可以同步：
加定时启动：
/5 * /usr/sbin/ntpdate time.windows.com >/dev/null 2>&1
时间服务器：
asia.pool.ntp.org
time.nist.gov
time.nuri.net
```

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

##### rsync文件同步
`rsync -vzrtopg --progress -e 'ssh -p 22' 用户名@srv-ip:/home/ubuntu/bost/ ./`

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

#### SSH pem->pub
`ssh-keygen -e -f key.pem >> key.pem.pub`

`ssh-keygen -t rsa -C "lilvhua@wbf.io"`

#### AWS 磁盘扩容
```
步骤：
1：修改ec2对应的卷,设置需要的大小;等待同步...
2:   登录ec2 里面使用 命令 lsblk 查看
3：找到对应的硬盘 命令 sudo growpart /dev/nvme1n1 1
4：resize2fs /dev/nvme1n1p1 既可
5：df -Th查看
```

#### A1398换键盘
https://v.youku.com/v_show/id_XOTQ3OTk1Nzgw.html?refer=seo_operation.liuxiao.liux_00003303_3000_Qzu6ve_19042900

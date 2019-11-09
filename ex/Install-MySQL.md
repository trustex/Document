
## 系统要求
CentOS 7.x

#### https://www.cnblogs.com/edward2013/p/5313724.html

## 安装（添加mysql源安装）
```
wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
## rpm -Uvh http://repo.mysql.com//mysql57-community-release-el7-7.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum install mysql-community-server
#yum install mysql-community-client
#yum install mysql-community-common
```

### 启动mysql并设置为开机自启动服务
```
chkconfig mysqld on
service mysqld start
```
### 检查mysql服务状态
`service mysqld status`

##  数据库初始化
第一次启动mysql，会在日志文件中生成root用户的一个随机密码，使用下面命令查看该密码
`grep 'temporary password' /var/log/mysqld.log`

### 修改root用户密码
```
mysql -u root -p -h localhost
Enter password: 
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'Mysql-2016';
```

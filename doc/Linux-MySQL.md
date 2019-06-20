## MySQL单机版运维手册

### 参考：[MySQL优化](Linux-MySQL优化.md)

### （1）Centos
```
yum install cmake gcc gcc gcc-c++ 

cmake . \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql56 \
-DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITH_EXTRA_CHARSETS=all \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_MEMORY_STORAGE_ENGINE=1 \
-DWITH_DEBUG=0 \
-DWITH_READLINE=1 \
-DENABLED_LOCAL_INFILE=1 \
-DMYSQL_DATADIR=/mydata/data3306 \
-DMYSQL_USER=mysql
make & make install
```


### （2）Ubuntu
```
sudo apt-get install make cmake gcc g++ bison libncurses5-dev pkg-config

cmake . \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql56 \
-DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITH_EXTRA_CHARSETS=all \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_MEMORY_STORAGE_ENGINE=1 \
-DWITH_DEBUG=0 \
-DWITH_READLINE=1 \
-DENABLED_LOCAL_INFILE=1 \
-DMYSQL_DATADIR=/mydata/data3306 \
-DMYSQL_USER=mysql

sudo make & make install

cd /usr/local/mysql56
sudo scripts/mysql_install_db -user=mysql -basedir=/usr/local/mysql56 –datadir=/mydata/data3306/
```

### （3）MySQL-5.7
```
wget http://mirrors.163.com/mysql/Downloads/MySQL-5.7/mysql-boost-5.7.26.tar.gz 
tar zxvf mysql-boost-5.7.26.tar.gz 
cd mysql-5.7.26
cmake . \
-DCMAKE_INSTALL_PREFIX=/usr/local/mysql5 \
-DMYSQL_UNIX_ADDR=/tmp/mysql.sock \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITH_EXTRA_CHARSETS=all \
-DWITH_MYISAM_STORAGE_ENGINE=1 \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_MEMORY_STORAGE_ENGINE=1 \
-DWITH_DEBUG=0 \
-DWITH_READLINE=1 \
-DENABLED_LOCAL_INFILE=1 \
-DMYSQL_DATADIR=/data/data3306 \
-DMYSQL_USER=mysql \
-DWITH_BOOST=boost/boost_1_59_0/
```




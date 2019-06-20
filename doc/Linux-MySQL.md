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

### （4）MySQL5.7初始化
#### 编辑/etc/my.cnf
```
[mysql]
default-character-set=utf8
 
[mysqld]
basedir=/usr/local/mysql5
datadir=/usr/local/mysql5/data
socket = /tmp/mysql5.sock
#default-character-server=utf8
character-set-server=utf8
default-storage-engine=INNODB
port=3306
```

#### my.cnf 优化
```
[client]
port = 3306
socket = /tmp/mysql5.sock             #登陆MySQL客户端读取的socket文件
 
[mysqld]
sql_mode=NO_ENGINE_SUBSTITUTION,STRICT_TRANS_TABLES
basedir = /usr/local/mysql5       #MySQL的home路径
datadir = /usr/local/mysql5/data/  #MySQL的数据存放目录
port = 3306
socket = /tmp/mysql5.sock          #mysqld启动时读取的socket文件
character-set-server=utf8

default-storage-engine=INNODB

#slow search
slow_query_log=ON
slow_query_log_file=/usr/local/logs/mysql5-slow.log
long_query_time=2

log-queries-not-using-indexes=ON

log_error=/usr/local/logs/mysql5.log
 
back_log = 300
max_connections = 3000
max_connect_errors = 50
table_open_cache = 4096
max_allowed_packet = 32M
#binlog_cache_size = 4M
 
max_heap_table_size = 128M
read_rnd_buffer_size = 16M
sort_buffer_size = 16M
join_buffer_size = 16M
thread_cache_size = 16
query_cache_size = 128M
query_cache_limit = 4M
ft_min_word_len = 8
 
thread_stack = 512K
transaction_isolation = REPEATABLE-READ
tmp_table_size = 128M
#log-bin=mysql-bin 
server_id=1
 
innodb_buffer_pool_size = 1G
innodb_thread_concurrency = 16
innodb_log_buffer_size = 16M
 
innodb_log_file_size = 512M
innodb_log_files_in_group = 3
innodb_max_dirty_pages_pct = 90
innodb_lock_wait_timeout = 120
innodb_file_per_table = on
 
[mysqldump]
quick
 
max_allowed_packet = 32M
 
[mysql]
no-auto-rehash
default-character-set=utf8
safe-updates
 
[myisamchk]
key_buffer = 16M
sort_buffer_size = 16M
read_buffer = 8M
write_buffer = 8M
 
[mysqlhotcopy]
interactive-timeout
 
[mysqld_safe]
open-files-limit = 8192
```

#### 初始化
```
cd /usr/local/mysql
bin/mysqld --defaults-file=/etc/my.cnf --initialize-insecure --user=mysql
```

#### 启动脚本
```
cd support-files
cp mysql.server /etc/init.d/mysql
/etc/init.d/mysq start
```

#### 管理客户端
`./bin/mysql -uroot -p -S /tmp/mysql5.sock`

#### 修改root密码
`set password=password('新密码');`

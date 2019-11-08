
### CentOS7换源

#### https://blog.csdn.net/qq_37274323/article/details/81107958

### 1、备份
`mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup`

### 2、下载新的CentOS-Base.repo 到/etc/yum.repos.d/
`wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo`

### 3、生成缓存
`yum makecache`


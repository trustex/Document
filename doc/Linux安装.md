
## Linux系统相关安装

#### （1）交换分区建立
```
dd if=/dev/zero of=/opt/swap bs=1024 count=16384000
mkswap /opt/swap
swapon /opt/swap
```

#### （2）文件上传下载
###### centos安装
`yum -y install lrzsz`

###### ubuntu安装
`sudo apt-get install lrzsz`

###### 源码安装
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

###### 服务端上传:
`rz -y`
###### 服务端下载：
`sz test.tar.gz`

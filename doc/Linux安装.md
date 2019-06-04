
## Linux系统相关安装

### 交换分区建立
```
dd if=/dev/zero of=/opt/swap bs=1024 count=16384000
mkswap /opt/swap
swapon /opt/swap
```

## LTHN钱包运维手册

### 官网：https://lethean.io/
#### 安装
##### 源码： https://github.com/LetheanMovement/lethean


#### （1）启动节点
`nohup ./bin/letheand --rpc-bind-ip 127.0.0.1 --rpc-bind-port 9988 --restricted-rpc --confirm-external-bind --detach`


#### （2）启动钱包
```
nohup sudo ./lethean-wallet-rpc --daemon-address 127.0.0.1:9988 \
      --rpc-bind-ip 127.0.0.1 \
      --rpc-bind-port 1117 \
      --wallet-file my_lthn \
      --password 密码 \ 
      --confirm-external-bind &
```

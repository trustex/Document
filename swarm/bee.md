

## （1）安装支持组件
```
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

rpm -ivh epel-release-latest-7.noarch.rpm

yum install -y jq nc
```

## （2）下载安装 bee-clef
```
wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.12/bee-clef_0.4.12_amd64.rpm
rpm -i bee-clef_0.4.12_amd64.rpm
## 升级执行：rpm -Uvh bee-clef_0.4.12_amd64.rpm
```
### 启动：
```
systemctl start bee-clef
```
## （3）下载安装 bee
```
wget https://github.com/ethersphere/bee/releases/download/v0.6.1/bee_0.6.1_amd64.rpm
rpm -i bee_0.6.1_amd64.rpm
## 升级执行 rpm -Uvh bee_0.6.1_amd64.rpm
```

## （4）启动 bee 节点 (一个gbzz就可以启动)
```
bee start \
–verbosity 5 \
–swap-initial-deposit 10000000000000000 \
–swap-endpoint https://rpc.slock.it/goerli \
–debug-api-enable \
–clef-signer-enable \
–clef-signer-endpoint=/var/lib/bee-clef/clef.ipc
```

## （5）节点实时出票信息查看
```
http://swarm.xidusoft.com/swarm/bee/info/42.192.97.220/1635
将42.192.97.220换成你的服务器IP地址即可。
```
## （6）多节点安装启动脚本请加微信群获取技术支持。


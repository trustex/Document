
# Centos7 快速安装 Swarm Bee(含多节点启动脚本)

## （1）安装支持组件
```
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

rpm -ivh epel-release-latest-7.noarch.rpm

yum install -y jq nc
```

## （2）下载安装 bee-clef
```
wget wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.9/bee-clef_0.4.9_amd64.rpm

#0.6.1
#wget https://github.com/ethersphere/bee-clef/releases/download/v0.4.12/bee-clef_0.4.12_amd64.rpm

rpm -i bee-clef_0.4.9_amd64.rpm

## 升级执行：rpm -Uvh bee-clef_0.4.12_amd64.rpm
```
### 启动：
```
systemctl start bee-clef
```
## （3）下载安装 bee
```
wget https://github.com/ethersphere/bee/releases/download/v0.5.3/bee_0.5.3_amd64.rpm

#0.6.1
#wget https://github.com/ethersphere/bee/releases/download/v0.6.1/bee_0.6.1_amd64.rpm

rpm -i bee_0.5.3_amd64.rpm

## 升级执行 rpm -Uvh bee_0.6.1_amd64.rpm
```

## （4）获取钱地址
#### 执行命令
`bee-get-addr`

#### 输出信息如下
```
Please make sure there is sufficient ETH and BZZ available on the node's 

Ethereum address: 42d011b625151ff4bb0bfb753a71a567e7dda1df.

Learn how to fund your node by visiting our docs at at https://docs.ethswarm.org/docs/installation/fund-your-node

Once the node's wallet has received the funds it will begin joining the Swarm network.

See the docs for more at https://docs.ethswarm.org/docs/.
```
#### 钱包地址类似（注以下是我的钱包地址，从上面输出找你的钱包地址）
`0x42d011b625151ff4bb0bfb753a71a567e7dda1df`

## （5）启动 bee 节点 (1个gbzz 和 0.05 个eth 就可以启动)
#### 单节点
```
bee start \
–verbosity 5 \
–swap-initial-deposit 10000000000000000 \
–swap-endpoint https://rpc.slock.it/goerli \
–debug-api-enable \
–clef-signer-enable \
–clef-signer-endpoint=/var/lib/bee-clef/clef.ipc
```
#### 多节点
##### 脚本 muti-node-start.sh
```
#!/bin/bash

pnum=$1

if [ "$pnum" = "" ]; then
    echo "please input note number!"
    exit 1
fi

PORT1=$((pnum+1660))
PORT2=$((pnum+1760))
PORT3=$((pnum+1860))

bee start \
  --verbosity 5 \
  --swap-initial-deposit 10000000000000000 \
  --swap-endpoint https://rpc.slock.it/goerli \
  --debug-api-enable \
  --clef-signer-enable \
  --clef-signer-endpoint=/var/lib/bee-clef/clef.ipc \
  --api-addr ":${PORT1}" \
  --p2p-addr ":${PORT2}" \
  --debug-api-addr ":${PORT3}" \
  --data-dir "/data/swarm/bee${PORT1}-data" \
  --password "密码" > bee.log.${PORT1} 2>&1 &
```

##### 启动，需修改脚本密码
```
./muti-node-start.sh 1
./muti-node-start.sh 2
./muti-node-start.sh 3
./muti-node-start.sh 4
......
```

## （6）本地实时出票信息查看
`curl localhost:1635/chequebook/cheque | jq`

## （7）第三方平台节点实时出票信息查看
```
http://swarm.xidusoft.com/swarm/bee/info/42.192.97.220/1635
将42.192.97.220换成你的服务器IP地址即可。
```

## （8）swap-endpoint 问题
```
--swap-endpoint 
(1) 不能使用或出错的去infura网站申请免费的 https://infura.io/
(2) 或自己搭建 Goerli测试网 (香港或海外，国内不行，同步数据在30G左右)

./bin/geth --datadir /data/geth/goerli --goerli --rpc --rpcapi "admin,debug,eth,miner,net,personal,shh,txpool,web3" 2>>geth.log &

```
## （9）更多技术支持请加微信群。

###### 技术支持网站 https://xidusoft.com

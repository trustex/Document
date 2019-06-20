
## 以太坊布署、开发文档
### ETH以太坊钱包运维手册
#### 官网：https://www.ethereum.org/
#### 区块浏览器1：https://etherscan.io/
#### 区块浏览器1：https://eth.btc.com/
#### API手册1：http://cw.hubwiz.com/card/c/ethereum-json-rpc-api/
#### API手册2：https://www.orchome.com/958
#### API介绍：https://blog.51cto.com/iceman123/2089540
#### 简书文档-以太坊文档整理：https://www.jianshu.com/p/3445ff08229a
#### Geth命令说明 https://www.cnblogs.com/tinyxiong/p/7918706.html


### ETC以太经典钱包运维
#### 官网：https://ethereumclassic.org/
#### 区块浏览器1: http://gastracker.io/
#### 区块浏览器2：http://etherhub.io/

#### （1）安装
##### ETH
######  源码地址：https://github.com/ethereum/go-ethereum
######  BIN包：https://geth.ethereum.org/downloads/
###### 1.8.27 https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.8.27-4bcc0a37.tar.gz
###### 1.8.27-src https://github.com/ethereum/go-ethereum/archive/v1.8.27.tar.gz

##### 
##### ETC
###### 源码、BIN包地址：https://github.com/ethereumproject/go-ethereum

#### （2）启动
`./geth --syncmode fast --rpc --rpcaddr "内网IP" --rpcport "RPC端口"  --rpcapi "db,eth,net,web3,personal,admin" --cache=2048 --maxpeers 10000 2>>geth.log &`

##### 其他参数
```
--datadir=/data/eth/ethereum \
--syncmode light \
--port "30308" \
--rpcport "2308"\
--rpcapi "db,eth,net,web3,personal,admin" 
```

#### （3）登陆
`./geth attach 'http://ip:rpc端口'`

#### （4）日常命令
```
节点情况：eth.syncing
查询节点：net.peerCount
最新区块： eth.blockNumber
获取新地址：personal.newAccount()
解锁地址：personal.unlockAccount("地址")
查询余额：eth.getBalance("地址")
节点信息：admin.peers
```
#### （5）转账
##### 转账说明：
`eth.sendTransaction({from:"出款地址",to:"收款地址",value:web3.toWei(金额,"ether")})`
##### 转账示例：
```
eth.sendTransaction({from:"0x947e4ae8dd16902a8b76c212963a4617869adaa0",
                      to:"0xcdf03959b663d54471323c400c47d1ca94c93051",
                      value:web3.toWei(0.1，"ether")})
```


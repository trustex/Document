## 比特币BTC运维手册

####
##### 官网：https://bitcoin.org/
##### 比特币水龙头：https://coinfaucet.eu/en/btc-testnet/
##### 比特币测试网络查询：https://live.blockcypher.com/btc-testnet/address/2NFo1oyFSsorCGYT3jtaf4ipw7sgr2ap838/
##### 区块查询：http://btc.com
##### API查询：http://cw.hubwiz.com/card/c/bitcoin-json-rpc-api/

##### （1）安装
###### 源码地址： https://github.com/bitcoin/bitcoin
###### BIN 包：https://bitcoincore.org/bin/bitcoin-core-0.18.0/

##### （2）配置文件
###### /home/user/.bitcoin/bitcoin.conf
```
testnet=0
txindex=1
server=1
rpcport=rpc端口
rpcuser= 账号
rpcpassword=密码
rpcallowip=127.0.0.1/32
gen=0
```

##### （3）启动
`./bin/bitcoind -txindex -daemon`

##### （4）日常操作
###### 查询余额
` ./bin/bitcoind getbalance`

###### 钱包加密
`./bin/bitcoin-cli encryptwallet 密码`

###### 钱包解锁
`./bin/bitcoin-cli walletpassphrase 密码 300`

###### 钱包转账
`./bin/bitcoin-cli sendtoaddress 地址 金额`

###### 最新区块数量
`./bin/bitcoin-cli getblockcount`

###### 添加连接节点
`./bin/bitcoin-cli addnode 80.211.95.154 add`

###### 得到节点连接信息
`./bin/bitcoin-cli getaddednodeinfo true `


### 和比特币类似的币种有：
```
BCH
LTC
EXO
SINS
ABBC
CEN
CPC
DEV
FLASH
GRC
ILC
RPD
VIT
AIAS
GZRO
HPC
VIPS
XSG
```


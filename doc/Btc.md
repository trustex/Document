

####
##### 比特币水龙头：https://coinfaucet.eu/en/btc-testnet/
##### 比特币测试网络查询：https://live.blockcypher.com/btc-testnet/address/2NFo1oyFSsorCGYT3jtaf4ipw7sgr2ap838/

##### （1）安装
###### 源码地址： https://github.com/bitcoin/bitcoin
###### BIN 包：https://bitcoincore.org/bin/bitcoin-core-0.18.0/

##### （2）配置文件
###### /home/user/.bitcoin/bitcoin.conf

###### testnet=0
###### txindex=1
###### server=1
###### rpcport=rpc端口
###### rpcuser= 账号
###### rpcpassword=密码
###### rpcallowip=127.0.0.1/32
###### gen=0

##### （3）启动
###### ./bin/bitcoind -txindex -daemon

##### （4）日常操作
###### 查询余额
` ./bin/bitcoind getbalance`



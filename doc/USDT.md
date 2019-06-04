USDT运维手册

#### 官网 https://tether.to/
#### 区块浏览器：https://www.omniexplorer.info/asset/31

#### 支持主要币种有：USDT、MAID

#### （1）安装
###### Omni钱包：http://www.omnilayer.org/
###### Omni钱包源码：https://github.com/OmniLayer/omnicore

#### （2）启动
`./bin/omnicored -daemon -port=端口号 -conf=/home/user/.usdtcoin/bitcoin.conf -datadir=/home/user/.usdtcoin`

#### （3）配置文件同比特币 bitcoin.conf
```
testnet=0
txindex=1
server=1
rpcport=rpc端口号
rpcuser=账号
rpcpassword=密码
rpcallowip=127.0.0.1/32
gen=0
```

#### （4）日常维护命令同比特币

#### （5）转账USDT（先解锁钱包）
```
./bin/omnicore-cli -conf=/home/user/.usdtcoin/bitcoin.conf "omni_funded_send" "出款USDT地址" \
    "收款USDT地址" 31 "金额" \
    "手续费账号"
```



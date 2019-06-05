

## OGC钱包运维手册
#### 类似BTS

#### （1）源码
`git clone https://github.com/OneGramTech/onegram-core.git`

#### （2）安装
```
cd onegram-core
git checkout master # may substitute "master" with current release tag
git submodule update --init --recursive
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .
make
```

#### （3）配置文件(data/config.ini)添加
```
seed-nodes = ["seed1.onegram.org:8540","seed2.onegram.org:8540","seed3.onegram.org:8540","seed4.onegram.org:8540","seed5.onegram.org:8540","seed6.onegram.org:8540","seed7.onegram.org:8540","seed8.onegram.org:8540","seed9.onegram.org:8540","seed10.onegram.org:8540","seed11.onegram.org:8540","seed12.onegram.org:8540","seed13.onegram.org:8540","seed14.onegram.org:8540","seed15.onegram.org:8540","seed16.onegram.org:8540","159.69.7.216:8540","95.216.140.132:8540"]
```

#### （4）启动节点
```
nohup ./onegram-core/programs/witness_node/witness_node \
--genesis-json ./onegram-core/genesis.json \
-d ./onegram-core/data \
--rpc-endpoint 127.0.0.1:8090 &
```

##### 节点数据重新再来
`--resync-blockchain`

#### （5）创建钱包
```
cd ./onegram-core/programs/cli_wallet
./cli_wallet  wss://rpc.onegramcoin.net -H 127.0.0.1:1122 \
  --chain-id face06cbc342d7199b088b99ba00044034841f44c12e03ea2d61166bec2d732d
```
###### 设置密码
`set_password 密码`

###### 解锁
`unlock 密码`

###### 导入Key
`import_key 账号 私钥`

#### （5）启动RPC（连接本地节点）
```
cd ./onegram-core/programs/cli_wallet
./cli_wallet -w wallet.json -s ws://127.0.0.1:8090 -H 127.0.0.1:1122 \
  --chain-id face06cbc342d7199b088b99ba00044034841f44c12e03ea2d61166bec2d732d
```

#### （6）启动RPC（连接远程节点）
```
cd ./onegram-core/programs/cli_wallet
./cli_wallet -w wallet.json wss://rpc.onegramcoin.net -H 127.0.0.1:1122 \
  --chain-id face06cbc342d7199b088b99ba00044034841f44c12e03ea2d61166bec2d732d
```

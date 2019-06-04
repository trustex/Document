

##OGC钱包运维手册

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

#### （3）配置文件 config.ini
`seed-nodes=xxxx`

#### （4）启动节点
```
nohup ./onegram-core/programs/witness_node/witness_node \
--genesis-json ./onegram-core/genesis.json \
-d ./onegram-core/data \
--rpc-endpoint 127.0.0.1:8090 &
```

##### 节点数据重新再来
`--resync-blockchain`

#### （5）启动RPC
```
cd ./onegram-core/programs/cli_wallet
./cli_wallet -w bitker_wallet -s ws://127.0.0.1:8090 -H 127.0.0.1:1122
```

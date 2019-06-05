
## OGC钱包运维手册



#### 启动节点
nohup /data/ogc/onegram-core/programs/witness_node/witness_node --genesis-json /data/ogc/onegram-core/genesis.json -d /d
ata/ogc/onegram-core/data --rpc-endpoint 127.0.0.1:8090 &

#### 创建钱包
```
./cli_wallet -w wallet.json \
  -s wss://rpc.onegramcoin.net \
  -H 127.0.0.1:1122 \
  --chain-id face06cbc342d7199b088b99ba00044034841f44c12e03ea2d61166bec2d732d
```


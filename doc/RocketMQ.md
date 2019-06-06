
## RocketMQ运维手册

#### 官网：http://rocketmq.apache.org/
#### 快速指南：http://rocketmq.apache.org/docs/quick-start/

### 安装
#### BIN包：http://rocketmq.apache.org/dowloading/releases/

### 启动 Name Srv
```
#!/bin/bash
cd rocketmq-all-4.x/bin
FileDt=`date +20"%y%m%d%H%M"`
sh mqnamesrv > ../logs/mqnamesrv-${FileDt}.log &
#sh mqbroker -n localhost:9876 > ../logs/mqbroker-${FileDt}.log &
```

### 启动 Broker SRV
```
#!/bin/bash
cd rocketmq-all-4.x/bin
FileDt=`date +20"%y%m%d%H%M"`
#sh mqbroker -n localhost:9876 > ../logs/mqbroker-${FileDt}.log &
sh mqbroker -c ../conf/2m-noslave/broker-a.properties -n "ip1:9876;ip2:9876"  autoCreateTopicEnable=false >> ../logs/mqbroker-${FileDt}.log &
```

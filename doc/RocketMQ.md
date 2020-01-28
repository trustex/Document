
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

### 运维手册
```
RocketMQ常用命令

需要切换到bin目录下，即：
[root@mq-master01 ~]# cd /data/rocketmq/bin
[root@mq-master01 bin]#
 
获取所有可用命令：
[root@mq-master01 bin]# sh mqadmin
 
查看帮助：
# sh mqadmin <command> -h
查询Producer的网络连接情况：
# sh mqadmin producerConnection -n localhost:9876 -g <producer-group> -t <producer-topic>
查询Consumer的网络连接情况：
# sh mqadmin consumerConnection -n localhost:9876 -g <consumer-group>
查询Consumer的消费状态：
# sh mqadmin consumerProgress -n localhost:9876 -g <consumer-group>
 
查询消息是否发送成功
获取指定Topic：
# sh mqadmin topicList -n localhost:9876 | grep <topicName>
查看Topic状态：
# sh mqadmin topicStatus -n localhost:9876 -t <topicName>
根据offset获取消息：
# sh sh mqadmin queryMsgByOffset -n localhost:9876 -b <broker-name> -i <queueId> -o <offset> -t <topicName>
根据offsetMsgId查询消息：
# sh sh mqadmin queryMsgById -n localhost:9876 -i <offsetMsgId>
 
查询消息是否被消费成功
查询消息详情：
# sh mqadmin queryMsgById -i {MsgId} -n {NameServerAddr}
查看Consumer Group订阅了哪些TOPIC：
# sh mqadmin consumerProgress -g <ConsumerGroup> -n <NameServerAddr>
 
查询TOPIC被哪些Consumer Group订阅了
没有查询特定TOPIC订阅情况，只能查询所有后再过滤：
# sh mqadmin statsAll -n <NameServerAddr> | grep <TOPIC>
返回结果：#Topic #Consumer Group #InTPS #OutTPS #InMsg24Hour #OutMsg24Hour
 
关闭nameserver和所有的broker:
# sh mqshutdown namesrv
# sh mqshutdown broker
 
查看所有消费组group:
# sh mqadmin consumerProgress -n 192.168.23.159:9876
查看指定消费组（kevinGroupConsumer）下的所有topic数据堆积情况：
# sh mqadmin consumerProgress -n 192.168.23.159:9876 -g kevinGroupConsumer
查看所有topic :
# sh mqadmin topicList -n 192.168.23.159:9876
查看topic信息列表详情统计
# sh mqadmin topicstatus -n 192.168.23.159:9876 -t myTopicTest1
新增topic
# sh mqadmin updateTopic –n 10.45.47.168 –c DefaultCluster –t ZTEExample
删除topic
# sh mqadmin deleteTopic –n 10.45.47.168:9876 –c DefaultCluster –t ZTEExample
```

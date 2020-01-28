
### Linux下RocketMQ的安装
https://www.jianshu.com/p/912701cf1705

### DOC
```
查看集群情况 ./bin/mqadmin clusterList -n 127.0.0.1:9876
查看 broker 状态 ./bin/mqadmin brokerStatus -n 127.0.0.1:9876 -b 172.20.1.138:10911 (注意换成你的 broker 地址)
查看 topic 列表 ./bin/mqadmin topicList -n 127.0.0.1:9876
查看 topic 状态 ./bin/mqadmin topicStatus -n 127.0.0.1:9876 -t MyTopic (换成你想查询的 topic)
查看 topic 路由 ./bin/mqadmin topicRoute -n 127.0.0.1:9876 -t MyTopic

```

### 安装web可视化客户端rocketmq-externals 
https://github.com/apache/rocketmq-externals 

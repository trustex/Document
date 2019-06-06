
## XEM钱包运维手册
#### 官网： https://nem.io/
#### 源码： https://github.com/nemtech
#### 下载： https://nem.io/downloads/
#### Java BIN包： https://bob.nem.ninja/nis-0.6.97.tgz
#### API： https://nem.io/developers/

#### （1）配置文件(config.properties)
##### 可修改端口
`nem.httpPort = 7890`

##### 数据目录
`/home/user/nem`


#### （2）启动
```
#!/bin/bash

cd package/nis
nohup java -Xms1G -Xmx3G -cp ".:./*:../libs/*" org.nem.deploy.CommonStarter &
```

#### （3）常用命令
##### 查询节点高度
`curl http://127.0.0.1:7890/chain/height`

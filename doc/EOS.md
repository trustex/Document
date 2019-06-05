
## EOS轻钱包运维手册

#### 区块浏览器：https://eospark.com/
#### 账号信息：https://eospark.com/account/账号名

#### （1）安装
##### 源码：https://github.com/EOSIO/eos

#### （2）启动轻钱包
` nohup ./bin/keosd --config-dir /home/user/eosio-wallet --wallet-dir /home/user/eosio-wallet --http-server-address 127.0.0.1:9900
 --unix-socket-path /tmp/keosd.sock &`
 
#### （3）常用命令
##### 创建钱包
`./bin/teclos wallet create -n 钱包名称 --to-console`

##### 打开钱包
`./bin/teclos --wallet-url http://127.0.0.1:9900 wallet open -n 钱包名称`

##### 解锁钱包
`./bin/teclos --wallet-url http://127.0.0.1:9900 wallet unlock -n 钱包名称`

##### 生成公钥私钥对
`./bin/teclos wallet create key`

##### 导入私钥
`./bin/teclos wallet import -n 钱包名称`

#####  创建账号
`待整理`

##### 购买内存
`待整理`

##### 购买CPU
`待整理`

##### 赎回CPU
`待整理`

## 类似币种
#### [TELOS](TELOS.md)



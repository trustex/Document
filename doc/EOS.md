
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

## 参考 http://www.kjson.com/a/archives/tuijian/111
```
./cleos.sh --wallet-url http://127.0.0.1:8888 -u http://dev.cryptolions.io:38888 push action testtest4455 create '["testtest4455", "1000000.00000000 TKT", 0,0,0]' -p testtest4455

购买内存：
	./cleos.sh system buyram manor manor "100 EOS"

抵押net，cpu
	./cleos.sh system delegatebw bitkereosadd bitkereosadd "13.0000 EOS" "2.0000 EOS"
	./cleos.sh system delegatebw bitkereosout bitkereosout "20.0000 EOS" "2.0000 EOS"
	
	./cleos.sh system undelegatebw bitkereosadd bitkereosadd "12.0000 EOS" "0.0001 EOS"
	./cleos.sh system undelegatebw bitkereosout bitkereosout "18.0000 EOS" "0.0001 EOS"
	
	./cleos.sh system delegatebw bitkereosadd bitkereosadd "0.0001 EOS" "15.0000 EOS"
	./cleos.sh system delegatebw bitkereosout bitkereosout "0.0001 EOS" "5.0000 EOS"
 
发布官方合约：
	./cleos.sh set contract manor /usr/local/dataroot/gtc/eos/eos/build/contracts/eosio.token/
 
设置代币上限：
	./cleos.sh push action manor create '["manor", "1000000.0000 BITKER", 0,0,0]' -p manor
 
发行代币：
	./cleos.sh push action manor issue '["manor", "1000000.0000 BITKER", "issue"]' -p manor
 
代币转账：
	./cleos.sh push action manor transfer '["manor", "eric", "100.0001 BITKER", "test bitker"]' -p manor
```

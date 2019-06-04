
## ADS钱包运维手册

#### 源码： https://github.com/adshares/ads


#### （1）安装
```
sudo add-apt-repository ppa:adshares/releases -y
sudo apt-get update
sudo apt-get install ads ads-tools

sudo apt-get install python-pip
pip install flask flask_jsonrpc waitress
```

#### （2）配置文件（/home/user/.ads/settings.cfg）
```
port=6511
host=n01.e11.click
address=申请的ADS地址
secret=私钥
```

#### （3）启动
`/usr/bin/ads-json-rpc --host 127.0.0.1 --port rpc端口 &`

#### （4）日常操作
##### 账号查询 
`echo '{"run":"get_account","address":"ADS地址"}' | ads`

##### 转账
```
(echo '{"run":"get_me"}'; \
    echo '{"run":"send_one",\
    "address":"收款地址",\
    "amount":金额,\
    "message":"标签"}') | ads
```

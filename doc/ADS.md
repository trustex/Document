
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
##### 开启钱包TMUX窗口
`tmux new -s ads`
两个窗口操作  然后不要exit直接在crt等软件把窗口x掉
###### 启动钱包
`ads`

###### 进入钱包TMUX窗口
`tmux a -t ads`

###### 开启钱包RPC
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

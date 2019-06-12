## GXC/GXB 公信宝钱包运维手册

#### 官网 https://www.gxchain.org/
#### 区块浏览器 https://docs.gxchain.org/zh/guide/
#### 开发手册 https://docs.gxchain.org
#### 源码：https://github.com/gxchain/gxchain-explorer

#### 启用
##### TMUX启动
```
tmux new -s gxc
tmux a -t gxc
```

##### 节点钱包启动（远程）
`./cli_wallet --chain-id 4f7d07969c446f8342033acb3ab2ae5044cbe0fde93db02de75bd17fa8fd84b8 -s wss://node17.gxb.io -H 0.0.0.0:1235`

#### 设置密码
`set_password password`

#### 解锁钱包
`unlock password`

#### 生成KEY
`suggest_brain_key`
##### 结果如下
```
{
  "brain_priv_key": "key",
  "wif_priv_key": "私钥",
  "pub_key": "公钥"
}

```
#### 注册地址
```
curl 'https://opengateway.gxb.io/account/register' \
  -H 'Content-type:application/json' \
  -H 'Accept:application/json' \
  -d '{"account":{"name":"mygxcacc-add","owner_key":"公钥","active_key":"公钥","memo_key":"公钥","refcode":null,"referrer":null}}'

```

#### 导入私钥
`import_key mygxcacc-add 私钥`


## Linux之间配置SSH互信（SSH免密码登录）

#### 为简化SSH过程，采用证书方式，免去SSH登入时需要输入账号密码的过程，具体操作如下：

### 一、在SSH服务器所在机器上

#### 1、以root用户登录，更改ssh配置文件 /etc/ssh/sshd_config，去除以下配置的注释

RSAAuthentication yes #启用rsa认证
PubkeyAuthentication yes #启用公钥私钥配对认证方式
AuthorizedKeysFile .ssh/authorized_keys #公钥文件路径
#### 2、重启SSH服务
`[root@server /]#systemctl restart sshd  //重启ssh服务`

### 二、在客户端机器上

#### 1、生成公钥私钥对
`[root@client /]#ssh-keygen -t rsa`
##### 一路默认回车，系统在/root/.ssh下生成id_rsa、id_rsa.pub

#### 2、把id_rsa.pub发送到服务端机器上
`[root@client /]#ssh-copy-id -i /root/.ssh/id_rsa.pub 192.168.1.20 #server ip`

#### 3、验证
`[root@client /]#ssh 192.168.1.20 #server ip`

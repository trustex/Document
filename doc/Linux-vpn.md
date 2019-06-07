
## Linux VPN运维手册

#### 参考1：https://www.xuebuyuan.com/3240132.html
#### 参考2：https://blog.csdn.net/XuHang666/article/details/84584669
#### 参考3：https://blog.csdn.net/weixin_40581617/article/details/80107707

sudo apt install ppp pptpd iptables

iptables -t nat -A POSTROUTING -s 10.1.88.0/24 -j MASQUERADE

Centos安装L2TP+IPSec完整教程 https://www.cnblogs.com/archoncap/p/5170812.html


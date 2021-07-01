##  Swarm CMS 系统批量钱包发送配置
####  文件名 /data/cms/adminapi/application.yml
```
wallet:
  ## 是否测试环境 1 是测试环境 goerli，0 是正式DAI网络
  is_test_chain: 0
  ## 手续费倍数
  gwei_x: 1.05
  ## RPC
  swap_endpoint: http://rpc.xidusoft.com
#  bzz_contract_address: "0x2ac3c1d3e24b45c6c310534bc2dd84b5ed576335"
  ## bzz合约，不用修改
  bzz_contract_address: "0xdBF3Ea6F5beE45c02255B2c26a16F300502F68da"
  ## 批量注水或转账的钱包地址，校验用
  wallet_from_address: "0x7b5764f698a0fb58086a25257a111fbd65563b71"
  ## 批量注水或转账的钱包密码（来自clef导出）
  wallet_from_password: EVIs0gGswI
  ## 批量注水或转账的钱包私钥文件全路径 （来自clef导出）
  wallet_from_file: /data/cms/adminapi/eth-wallet.json
  ## 批量注水或转账功能开启
  trans_auto_status: 1

```

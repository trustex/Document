

### vim /etc/sysctl.conf
```
vm.overcommit_memory=1
vm.drop_caches=1
vm.zone_reclaim_mode=0
vm.max_map_count=655360
vm.dirty_background_ratio=50
vm.dirty_ratio=50
vm.dirty_writeback_centisecs=360000
vm.page-cluster=3
vm.swappiness=1
sysctl -p
```

#### 1.overcommit_memory
```
是否允许内存的过量分配
当为0的时候，当用户申请内存的时候，内核会去检查是否有这么大的内存空间
当为1的时候，内核始终认为，有足够大的内存空间，直到它用完了为止
当为2的时候，内核禁止任何形式的过量分配内存
```

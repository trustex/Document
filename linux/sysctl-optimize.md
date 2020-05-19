

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

#### 2.drop_caches
```
写入的时候，内核会清空缓存，腾出内存来，相当于sync
写1的时候，会清空页缓存，就是文件
写2的时候，会清空inode和目录树
写3的时候，都清空
This is a non-destructive operation and will only free things that are completely unused.
Dirty objects will continue to be in use until written out to disk and are not freeable.
If you run "sync" first to flush them out to disk, these drop operations will tend to free more memory.
```

#### 3.zone_reclaim_mode
```
如果为0的话，那么系统会倾向于从其他节点分配内存
如果为1的话，那么系统会倾向于从本地节点回收Cache内存多数时候
```

#### 4.max_map_count
```
定义了一个进程能拥有的最多的内存区域，默认为65536
```

#### 5.dirty_background_bytes/dirty_background_ratio
```
当dirty cache到了多少的时候，就启动pdflush进程，将dirty cache写回磁盘
当有dirty_background_bytes存在的时候，dirty_background_ratio是被自动计算的
```

#### 6.dirty_bytes/dirty_ratio
```
当一个进程的dirty cache到了多少的时候，启动pdflush进程，将dirty cache写回磁盘
当dirty_bytes存在的时候，dirty_ratio是被自动计算的
```

#### 7.
```
```
#### 8.
```
```
#### 9.
```
```
#### 10.
```
```
#### 11.
```
```
#### 12.
```
```
#### 13.
```
```
#### 14.
```
```



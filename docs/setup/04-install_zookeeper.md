# 04-install_zookeeper

```bash
roles/zookeeper
├── files
├── handlers
│   └── main.yml
├── tasks
│   └── main.yml
├── templates
│   ├── myid.j2
│   ├── zoo.cfg.cluster.j2
│   └── zookeeper.sh
└── vars
    └── main.yml
```
## 安装前说明

Zookeeper 安装即支持单节点 sandalone 模式也支持 Zookeeper 集群模式。

## 获取源码包

自行到 [Zookeeper 官网下载](http://mirror.bit.edu.cn/apache/zookeeper/)   下载后将软件包放置到 roles/zookeeper/files/ 目录下。

## 需要修改的地方

```yaml
$ cat roles/zookeeper/vars/main.yml
# zookeeper 的版本号，files 目录下要存在对应的版本
version: 3.4.10 
# 存储快照文件snapshot的目录
dataDir: /data/zookeeper
# 事务日志输出目录
dataLogDir: /data/logs/zookeeper
# 客户端连接server的端口
clientPort: 2181
# Leader服务器交换信息的端口
leader_port: 2888
# 集群选举端口
vote_port: 3888
# 引用 hosts 主机清单中的 [zookeeper]
zk_hosts: zookeeper
```

**另外 hosts 文件中定义的 [zookeeper] 组内的所有主机也要加上 myid 变量，参考 【ansible 主机清单参考】**

## ansible 主机清单参考

```bash
# standalone 模式
[zookeeper]
10.100.4.177 myid=1

# 集群模式奇数个节点不要忘记修改 myid
[zookeeper]
10.100.4.177 myid=1
10.100.4.178 myid=2
10.100.4.179 myid=3
```

## 验证

```bash
$ ansible-playbook 04.zookeeper.yml
```

执行成功后登录到各 Zk 节点检查 Zookeeper 运行状态：

```bash
$ zkServer.sh status
```



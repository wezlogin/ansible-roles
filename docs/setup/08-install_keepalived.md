# 08-安装 keepalived

```bash
roles/keepalived
├── files
│   ├── keepalived-rpm.tar.gz
│   └── keep_down.sh
├── handlers
│   └── main.yml
├── tasks
│   ├── keepalived_setup.yml
│   └── main.yml
├── templates
│   ├── multi_keepalived_backup.conf.j2
│   ├── multi_keepalived_master.conf.j2
│   ├── single_keepalived_backup.conf.j2
│   └── single_keepalived_master.conf.j2
└── vars
    └── main.yml
```

## 部署拓扑图

### 1. 部署主从模式

![keepalived-s](http://img.opsbj.com/keepalived-s.png)

### 2. 部署互为主备模式

![keepalived-m](http://img.opsbj.com/keepalived-m.png)

## 需要修改的地方

### 1. 修改环境变量 

```bash
$ cat roles/keepalived/vars/main.yml 
INTERFACE: ens32 # VIP 配置在哪块网卡之上，这里是网卡名
```

### 2. 定义 /etc/ansible/hosts 主机清单

```bash
[keepalived]
192.168.101.101 role=master m_ins=true s_m_vip=192.168.101.105 m_m_vip=192.168.101.105 m_b_vip=192.168.101.106 m_cast=224.0.0.18
192.168.101.104 role=backup m_ins=true s_m_vip=192.168.101.105 m_m_vip=192.168.101.106 m_b_vip=192.168.101.105 m_cast=224.0.0.18

# role={master|backup} 定义当前服务器 keepalived 的角色；
# m_ins={true|false}：false表示当前是工作在主从模式，true表示keepalived工作在互为主备的模式下；
# s_m_vip={IPADDR}：定义在主从模式下的 VIP 地址；
# m_m_vip={IPADDR}：定义在互为主备模式下当前节点的 MASTER 的 VIP；
# m_b_vip={IPADDR}：定义在互为主备模式下当前节点的 BACKUP 的 VIP；
# m_cast={IPADDR}：定义多播地址，当局域网内存在多个虚拟路由器时应使用不同的多播地址；
```

## 验证

```bash
$ ansible-playbook 08.keepalived.yml
```

验证 VIP 是否正确配置

```bash
ansible keepalived -m shell -a "ifconfig"
```



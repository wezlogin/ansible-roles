# 07-安装 zabbix-agent

```bash
roles/zabbix-agent/
├── files
│   └── zabbix-agent-4.2.5-1.el7.x86_64.rpm
├── handlers
│   └── main.yml
├── tasks
│   ├── main.yml
│   └── zabbix_setup.yml
├── templates
│   └── zabbix_agentd.conf.j2
└── vars
```

## 需要修改的地方

```bash
# cat roles/zabbix-agent/templates/zabbix_agentd.conf.j2 
PidFile=/var/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix/zabbix_agentd.log
EnableRemoteCommands=0
# 修改为 zabbix-server 的 IP 地址
Server=10.100.4.129
StartAgents=8
# 修改为 zabbix-server 的 IP 地址
ServerActive=10.100.4.129:10051
Hostname={{ ansible_default_ipv4.address }}
Timeout=30
Include=/etc/zabbix/zabbix_agentd.d/
UnsafeUserParameters=1
HostMetadataItem=system.uname
```

## /etc/ansible/host 配置参考

```bash
[zabbix-agent]
10.100.4.130
```

## 验证

```bash
$ ansible-playbook 07.zabbix-agent.yml
```

执行成功后可以在 zabbix-server 管理后台查看是否有主机自动注册；



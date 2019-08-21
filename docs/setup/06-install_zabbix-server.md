# 06-安装 zabbix-server

```bash
zabbix-server/
├── files
│   ├── defines.inc.php
│   ├── expect.sh
│   ├── simkai.ttf
│   └── zabbix-server-rpm.tar.gz
├── handlers
│   └── main.yml
├── tasks
│   ├── main.yml
│   ├── mysql.yml
│   ├── systemd.yml
│   └── zabbix_setup.yml
└── templates
    ├── zabbix.conf.j2
    └── zabbix_server.conf.j2
```

## /etc/ansible/host 配置参考

```bash
[zabbix-server]
192.168.101.101
```

## 验证

```bash
$ ansible-playbook 06.zabbix-server.yml
```

执行成功后，访问 zabbix-server：`http://IP/zabbix`  创建一个自动注册的动作，后面批量安装的 zabbix-agent 会自动注册到 zabbix-server ；






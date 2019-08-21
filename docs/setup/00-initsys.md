# 00-系统初始化

```bash
roles/initsys
├── handlers
│   └── main.yml
├── tasks
│   ├── base.yml
│   ├── hostname.yml
│   ├── main.yml
│   ├── security.yml
│   └── sysctl.yml
└── templates
    ├── 20-nproc.conf.j2
    ├── locale.conf.j2
    └── sysctl.conf.j2
```

## /etc/ansible/host 配置参考

```bash
[initsys]
192.168.101.101
```

## 验证

```bash
$ ansible-playbook 00.initsys.yml
```








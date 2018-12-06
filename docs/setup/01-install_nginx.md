## 01-安装 Nginx 服务

```bash
roles/nginx
├── files 
│   └── nginx.sh
├── handlers
│   └── main.yml
├── tasks
│   └── main.yml
├── templates
│   └── nginx.conf.c7.j2
└── vars
    └── main.yml
```

## 获取源码包

自行到 Nginx 官网下载 nginx-x.xx.x.tar.gz 的软件包放置到 `roles/nginx/files/` 目录下。

## 需要修改的地方

```bash
$ cat roles/nginx/vars/main.yml
username: daemon # 设置运行 Nginx 进程的用户，该用户必须在远程主机上存在；CentOS7 默认就存在 daemon 用户
version: 1.8.1  # Nginx 的版本号；files 目录下必须存在对应版本源码包
```
## ansible 主机清单参考

```bash
[webservers]
10.100.4.177
10.100.4.178
```

## 验证

```bash
ansible-playbook --check 01-nginx.yml
```

验证成功后去掉 `--check` 执行任务

```bash
ansible-playbook 01-nginx.yml
```

验证服务是否运行

```bash
ps -ef | grep "nginx"
ss -tnl | grep "80"
```



# 09-安装 MySQL

本 Task 基于 MySQL 通用二进制安装，默认安装成功后是单机运行 3306 和 3307，如果不想用多实例，可以把 3307 实例关闭。

```bash
mysql
├── files
│   ├── libaio-0.3.109-13.el7.x86_64.rpm
│   ├── mysql-5.7.27-linux-glibc2.12-x86_64.tar.gz
│   └── mysql.sh
├── tasks
│   ├── main.yml
│   └── mysql_setup.yml
├── templates
│   └── my.cnf.j2
└── vars
    └── main.yml
```

## 获取安装包

在 MySQL 官方下载 mysql-5.7.27-linux-glibc2.12-x86_64.tar.gz 放到 /etc/ansible/roles/mysql/file/ 目录下。

## 需要修改的地方

### 1. 修改环境变量 

```bash
# cat mysql/vars/main.yml 
DATADIR: /data/mysql # 定义 MySQL 数据存储目录
LOGDIR: /data/mysql/logs # 定义 MySQL 二进制日志和错误日志目录
BASEDIR: /usr/local/mysql # 这个不用修改默认安装在 /usr/local/mysql
USER: mysql # 定义用来初始化运行 MySQL 的用户，默认不用修改
```

## 验证

运行结束后会重启 MySQL 服务器

```bash
$ ansible-playbook 09.mysql.yml
```

验证 MySQL 是否运行

```bash
ansible mysql -m shell -a "ss -tnl|egrep '3306|3307'"
```




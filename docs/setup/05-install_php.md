# 05-安装 php-fpm

```bash
roles/php/
├── files
│   └── php-fpm
├── handlers
│   └── main.yml
├── tasks
│   ├── install_php.yml
│   └── main.yml
├── templates
│   ├── php-fpm.conf.j2
│   ├── php.ini.j2
│   └── www.conf.j2
└── vars
    └── main.yml
```

## 获取源码包

自行到 [PHP 官网下载](http://cn2.php.net/downloads.php)   下载后将软件包放置到 roles/php/files/ 目录下。

## 需要修改的地方

```bash
$ cat roles/php/vars/main.yml
# PHP 的版本号，files 目录下必须存在对应版本的源代码包
version: 7.2.12
# 运行 php-fpm 的用户和组
username: www-data
groupname: www-data
# 监听的地址和端口
listen_addr: 127.0.0.1
listen_port: 9000
```
另外还有一个地方需要修改，如果 templates/www.conf.j2 文件中的内容需要替换需要将文件中 ";" 开头被注释的行进行转义否则 template 模块会报错，执行下面两条命令可以实现：

```bash
sed -i '/^;/s/^;/{% raw %};/g' www.conf.j2
sed -i '/^{% raw %}/s/$/{% endraw %}\n/g' www.conf.j2
```

## ansible 主机清单参考

```bash
[php-fpm]
10.100.4.170
```

## 验证

```bash
$ ansible-playbook 05.php.yml
```

执行成功后检查 php-fpm 是否运行，9000 端口是否监听：

```bash
$ ansible php-fpm -m shell -a "ps -ef|grep php-fpm|grep -v grep"

$ ansible php-fpm -m shell -a "ss -tnl|grep 9000"
```


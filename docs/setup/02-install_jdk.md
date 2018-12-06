## 02-安装 JDK

```bash
roles/jdk
├── files
│   └── jdk.sh
├── tasks
│   └── main.yml
└── vars
    └── main.yml
```

## 获取源码包

自行到 [Oracle 官网下载](https://www.oracle.com/technetwork/java/javase/archive-139210.html)   下载后将软件包放置到 roles/jdk/files/ 目录下。

## 需要修改的地方

```bash
$ cat roles/jdk/vars/main.yml
version: jdk-8u121-linux-x64.tar.gz  # 你要安装 JDK 的包名
link: jdk1.8.0_121 # 安装包解压后的目录名字
```

## ansible 主机清单参考

```bash
[javaservers]
10.100.4.179
```

## 验证

```bash
$ ansible-playbook  02.jdk.yml
```

验证 Java 版本

```bash
$ ansible javaservers -m shell -a "java -version"
```

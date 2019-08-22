# 03-安装Tomcat服务

```bash
tomcat
├── defaults
│   └── main.yml
├── files
│   └── tmp.txt
├── tasks
│   ├── install-tomcat.yml
│   └── main.yml
└── templates
    ├── catalina.sh.j2
    └── server.xml.j2
```

## 获取源码包

1、下载 Tomcat 程序包 [Tomcat 官网下载](https://tomcat.apache.org/)   下载后将软件包放置到 roles/tomcat/files/ 目录下。

## 需要修改的地方

**修改 roles/tomcat/defaults/main.yml**
```bash
# Tomcat 版本
TOMCAT_VER:    8.5.15
```

server.xml 常用优化参数说明：

```bash
protocol="HTTP/1.1"

maxHttpHeaderSize="8192"

maxThreads="1000" //最大线程数，默认200

minSpareThreads="100" //Tomcat初始化时创建的socket线程数，线程的最小运行数目，这些始终保持运行，如果未指定，默认值为10

maxSpareThreads="1000"//Tomcat连接器的最大空闲socket线程数

minProcessors="100"//服务器创建时的最小处理线程数

maxProcessors="1000"//服务器同时最大处理线程数

enableLookups="false"//关闭DNS反向查询，若设为true,则支持域名解析，可把ip地址解析为主机名

compression="on"//打开压缩功能

compressionMinSize="2048"

compressableMimeType="text/html,text/xml,text/javascript,text/css,text/plain"

connectionTimeout="20000"//代表连接超时时间，单位为毫秒，默认值为60000。通常情况下设置为30000

URIEncoding="utf-8"//URL统一编码

acceptCount="1000"//监听端口队列最大数，满了之后客户请求会被拒绝（不能小于maxSpareThreads），如果未指定，默认值为100

redirectPort="8443"//在需要基于安全通道的场合，把客户请求转发到基于SSL的redirectPort端口

disableUploadTimeout="true"/>//这个标志允许servlet[Container](http://lib.csdn.net/base/4)在一个servlet执行的时候，使用一个不同的，更长的连接超时。最终的结果是给servlet更长的时间以便完成其执行，或者在数据上载的时候更长的超时时间。如果没有指定，设为false

以上内容来自简书：https://www.jianshu.com/p/4024bddc0550
```

catalina.sh 参数说明：

```bash
-Dfile.encoding：默认文件编码
-server：表示这是应用于服务器的配置，JVM 内部会有特殊处理的
-Xmx1024m：设置JVM最大可用内存为1024MB
-Xms1024m：设置JVM最小内存为1024m。此值可以设置与-Xmx相同，以避免每次垃圾回收完成后JVM重新分配内存。
-XX:NewSize：设置年轻代大小
-XX:MaxNewSize：设置最大的年轻代大小
-XX:PermSize：设置永久代大小
-XX:MaxPermSize：设置最大永久代大小
-XX:NewRatio=4：设置年轻代（包括 Eden 和两个 Survivor 区）与终身代的比值（除去永久代）。设置为 4，则年轻代与终身代所占比值为 1：4，年轻代占整个堆栈的 1/5
-XX:MaxTenuringThreshold=10：设置垃圾最大年龄，默认为：15。如果设置为 0 的话，则年轻代对象不经过 Survivor 区，直接进入年老代。对于年老代比较多的应用，可以提高效率。如果将此值设置为一个较大值，则年轻代对象会在 Survivor 区进行多次复制，这样可以增加对象再年轻代的存活时间，增加在年轻代即被回收的概论。
-XX:+DisableExplicitGC：这个将会忽略手动调用 GC 的代码使得 System.gc() 的调用就会变成一个空调用，完全不会触发任何 GC

以上内容来自简书：https://www.jianshu.com/p/4024bddc0550
```


## ansible 主机清单参考

```bash
[tomcat]
192.168.101.101
```

## 验证

```bash
$ ansible-playbook 03.tomcat.yml
```

检查 Tomcat 是否启动：

```bash
$ ansible tomcat -m shell -a "ss -tnl|grep 8080"

$ ansible tomcat -m shell -a "ps -ef|grep java"
```

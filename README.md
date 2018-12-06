本项目针对运维人员平时需要经常部署的一些常见应用服务；基于二进制或 RPM 包方式部署和利用 ansible-playbook 实现自动化，可以灵活的组织各个组件。

## 安装概览

### 环境说明

| OS 版本 | CentOS 7.5.1804 |
| --- | --- |
| Ansible  | 2.7.1-1.el7 |

### 获取项目代码

```bash
$ git clone https://github.com/wangenzhi/ansible.git
$ cd ansible/
$ mv roles /etc/ansible/
```

现在就可以部署各个程序了，各程序的部署方法参见【安装指南】

## 安装指南

| [01-安装 Nginx](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/01-install_nginx.md)  | [02-安装 JDK](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/02-install_jdk.md) | [03-安装 Tomcat](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/03-install_tomcat.md) | [04-安装 Zookeeper 集群](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/04-install_zookeeper.md)|
| --- | --- | --- | --- |
|[05-安装 php-fpm](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/05-install_php.md)|||







## 关于我
* 王恩志/男/1990
* 工作年限：4年
* 技术博客：https://codegreen.cn
* GitHub：https://github.com/wangenzhi
* QQ & 微信：510749025
* 目前状态：Linux 运维工程师、K8S运维，目前在帝都任职在一家不知名互联网公司。


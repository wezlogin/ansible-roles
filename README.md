本项目针对运维人员平时需要经常部署的一些常见应用服务；基于二进制或 RPM 包方式部署和利用 ansible-playbook 实现自动化，可以灵活的组织各个组件。

## 安装概览

### 环境说明

| OS 版本 | CentOS 7.5.1804 |
| --- | --- |
| Ansible  | 2.7.1-1.el7 |

### 获取项目代码

```bash
$ git clone https://github.com/wezlogin/ansible-roles.git
$ cd ansible/
$ mv roles /etc/ansible/
```

现在就可以部署各个程序了，各程序的部署方法参见【安装指南】

## 安装指南

| [安装Nginx](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/01-install_nginx.md)  | [安装JDK](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/02-install_jdk.md) | [安装Tomcat](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/03-install_tomcat.md) | [安装Zookeeper 集群](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/04-install_zookeeper.md)|
| --- | --- | --- | --- |
|**[安装php-fpm](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/05-install_php.md)**|**[安装zabbix-server](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/06-install_zabbix-server.md)**|**[安装zabbix-agent](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/07-install_zabbix-agent.md)**|**[系统初始化](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/00-initsys.md)** |
| **[安装keepalived](https://github.com/wezlogin/ansible-roles/blob/master/docs/setup/08-install_keepalived.md)** |  |  |  |

## 关于我

* 技术博客：https://www.xibdi.com
* QQ & 微信：510749025
* 目前状态：Linux 运维工程师，目前在帝都任职在一家不知名互联网公司。


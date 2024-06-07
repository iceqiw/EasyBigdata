# kerberos 安装

## 构建 docker 镜像

```
docker build -t kdc:1.0 .
```

## kdc 安装

`yum install -y krb5-server krb5-libs krb5-auth-dialog`

## kdc 配置

```shell
vi /var/kerberos/krb5kdc/kdc.conf
```

```
[kdcdefaults]
 kdc_ports = 88
 kdc_tcp_ports = 88

[realms]
 HADOOP.COM = {
  #master_key_type = aes256-cts
  acl_file = /var/kerberos/krb5kdc/kadm5.acl
  dict_file = /usr/share/dict/words
  admin_keytab = /var/kerberos/krb5kdc/kadm5.keytab
  max_renewable_life = 7d
  supported_enctypes = aes128-cts:normal des3-hmac-sha1:normal arcfour-hmac:normal camellia256-cts:normal camellia128-cts:normal des-hmac-sha1:normal des-cbc-md5:normal des-cbc-crc:normal
 }
```

## krb5 配置

```shell
vi /etc/krb5.conf
```

```
# Configuration snippets may be placed in this directory as well
includedir /etc/krb5.conf.d/

[logging]
 default = FILE:/var/log/krb5libs.log
 kdc = FILE:/var/log/krb5kdc.log
 admin_server = FILE:/var/log/kadmind.log

[libdefaults]
 dns_lookup_kdc = false
 dns_lookup_realm = false
 ticket_lifetime = 24h
 renew_lifetime = 7d
 forwardable = true
 default_realm = HADOOP.COM
 udp_preference_limit = 1
[realms]
 HADOOP.COM = {
  kdc = kdc
  admin_server = kdc
 }

[domain_realm]
 .hadoop.com = HADOOP.COM
 hadoop.com = HADOOP.COM
```

## kadmin 修改

```shell
vi /var/kerberos/krb5kdc/kadm5.acl

改为 HADOOP.COM
```

## 初始化

```
/usr/sbin/kdb5_util create -s -r HADOOP.COM
```

## 启动

```bash
systemctl start kadmin krb5kdc
```

## 遇到问题

客户端配置需要指定 tcp 协议

```
kdc = tcp/realm.example.com:88

[realms]
 HADOOP.COM = {
  kdc = tcp/kdc:88
  admin_server = kdc
 }
```

## 常用命令

```
kadmin.local

kinit qiwei/admin

addprinc qiwei/admin

addprinc -randkey hdfs/bd-master-1@HADOOP.COM
addprinc -randkey HTTP/bd-master-1@HADOOP.COM
xst -k hdfs.keytab hdfs/bd-master-1@HADOOP.COM
xst -k HTTP.keytab HTTP/bd-master-1@HADOOP.COM


addprinc -randkey test/bd-master-1@HADOOP.COM
xst -k test.keytab test/bd-master-1@HADOOP.COM

ktutil
rkt hdfs.keytab
rkt HTTP.keytab
wkt hdfs.keytab
exit
```

## 参考

https://www.jianshu.com/p/27d049bd8021

https://www.jianshu.com/p/7e839226a200

https://www.jianshu.com/p/f84c3668272b

https://blog.csdn.net/lovebomei/article/details/80007631

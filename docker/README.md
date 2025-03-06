# docker+python2+mysql8+binlog2sql 数据恢复方案
适配mysql8，PyMySQL设置为0.9.3

# 构建恢复镜像
docker build -t binlog2sql:v1 .

# 推送阿里镜像库
...

# 执行脚本
docker run --rm --network=host -v /etc/localtime:/etc/localtime -w /usr/src/app binlog2sql:v1 python binlog2sql.py -h127.0.0.1 -P3306 -uroot -p'123456' -d db --start-file='binlog.000016' --start-datetime='2023-05-11 15:28:00' --stop-datetime='2023-05-11 15:28:59' > back.sql

# 简化执行
```bash
# ~/.bashrc添加别名
alias binlog2sql="docker run --rm --network=host -v /etc/localtime:/etc/localtime -w /usr/src/app registry.cn-hangzhou.aliyuncs.com/duanlinfei/binlog2sql:v1 python binlog2sql.py"

# 执行 
 binlog2sql -h127.0.0.1 -P3306 -uroot -p'123456' -d db --start-file='binlog.000016' --start-datetime='2023-05-11 15:28:00' --stop-datetime='2023-05-11 15:28:59' > back.sql
```


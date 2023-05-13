# docker+python2+mysql8+binlog2sql 数据恢复方案
适配mysql8，PyMySQL设置为0.9.3

# 构建恢复镜像
docker build -t python:binlog2sql .

# 执行脚本
docker run --rm --network=host -v /etc/localtime:/etc/localtime -w /usr/src/app python:binlog2sql python binlog2sql.py -h127.0.0.1 -P3306 -uyfroot -p'YFi!2332!#@)(@#!9095' -d solid-waste --start-file='binlog.000016' --start-datetime='2023-05-11 15:28:00' --stop-datetime='2023-05-11 15:28:59'

# mysqlbinlog恢复方案
./mysqlbinlog -v --base64-output=decode-rows --start-datetime="2023-05-11 15:28:00" --stop-datetime="2023-05-11 15:28:59" /www/server/data/binlog.000016

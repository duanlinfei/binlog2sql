docker run --rm --network=host -v /etc/localtime:/etc/localtime -w /usr/src/app python:binlog2sql python binlog2sql.py $@

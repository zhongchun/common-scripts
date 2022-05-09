#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Please intput parameter: file_name" >&2
    exit 1
fi

file="$1"
host=$2
port=$3
user=$4
password=$5
database=$6

MYSQL='/home/map/.jumbo/bin/mysql'

cmd="${MYSQL} -h$host -P$port -u$user -p$password -D$database -e \"load data local infile '${file}' replace  into table guiding_screen_render fields terminated by'\t' lines terminated by '\n' (id,cityCode,configData,screenId,createTime,updatetime,renderTime)\""

eval "${cmd}"

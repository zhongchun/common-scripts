#!/bin/bash

mysql_bin='/home/map/.jumbo/bin/mysql'

host=$1
port=$2
user=$3
password=$4
database=$5
${mysql_bin} -h$host -P$port -u$user -p$password -D$database -N -e "set character set utf8; select * from guiding_screen_render"  > guiding_screen_render.txt

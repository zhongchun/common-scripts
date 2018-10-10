#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Please intput parameter: file_name" >&2
    exit 1
fi

file="$1"

MYSQL='/home/map/.jumbo/bin/mysql'

cmd="${MYSQL} -h10.38.41.58 -P6266 -uui36qx66266 -pPL37ojsbVyTvzBofl -Dcongest_analysis -e \"load data local infile '${file}' replace  into table guiding_screen_render fields terminated by'\t' lines terminated by '\n' (id,cityCode,configData,screenId,createTime,updatetime,renderTime)\""

# cmd="${MYSQL}  -uroot  -pMhxzKhl   -hcp01-map-da02.cp01.baidu.com   -P3306  -Dyanpan -e \"load data local infile '${file}' replace  into table baidu_event_base_data fields terminated by'\t' lines terminated by '\n' (id,bdeventid,platform,type,provincecode,citycode,districtname,starttime,offlinetime,location,direction,name,roadtype,lane,detail,content,ugcpro,ugccon,pic,uname,source,eventsource,valid,inmajor,createtime,updatetime)\""

eval "${cmd}"

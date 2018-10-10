#!/bin/bash

mysql_bin='/home/map/.jumbo/bin/mysql'

${mysql_bin} -h10.38.41.58 -P6266 -uui36qx66266 -pPL37ojsbVyTvzBofl -Dcongest_analysis -N -e "set character set utf8; select * from guiding_screen_render"  > guiding_screen_render.txt
# ${mysql_bin} -uitcp_web_w -pnMpQTUgJlYhAC1y3 -h10.111.80.218 -P7045 -Dmap_itcp_web -N -e "set character set utf8; select * from guiding_screen_render"  > guiding_screen_render.txt

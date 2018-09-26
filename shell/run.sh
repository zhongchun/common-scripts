#!/bin/bash

set -e

if [ ! -n "$2" ] ;then
    mainClass='com.baidu.jiaotong.congest.schedule.Bootstrap'
else
    mainClass=$2
fi

ROOTPATH=$(cd `dirname $0`/.. && pwd)
cd $ROOTPATH


wait_for() {
    local try=$1
    shift
    for ((;try>0;try--)); do
        if $@ ; then
            return 0
        fi
        echo -n .
        sleep 1
    done
    return 1
}

process_exists() {
   count=`ps -ef | grep $mainClass | grep -v "$0" | grep -v "grep" | wc -l`
   if [ 0 == $count ];then
       return 0
   else
       return 1
   fi
}

not() {
    if $@; then
        return 0;
    else
        return 1;
    fi
}

echolog() {
    echo "$(date +'%Y-%m-%d %k:%M:%S.%N ')$1"
}
start() {
    echolog 'starting'

    for d in lib/*.jar;
    do
        CLASSPATH=${CLASSPATH}:"$d"
    done

    for s in conf; #/*.properties;
    do
        CLASSPATH=${CLASSPATH}:"$s"
    done

    export  CLASSPATH

    echolog 'set rootPath='$ROOTPATH
    echolog 'set CLASSPATH='$CLASSPATH
    echolog 'set MAINCLASS='$mainClass

    mkdir log/java/schedule -p
    mkdir log/java/service -p
    nohup /home/map/.jumbo/opt/sun-java7/bin/java -Dproject.rootPath=$ROOTPATH -cp $CLASSPATH:congest-0.0.1-SNAPSHOT.jar $mainClass  > log/java/service/$(date +%Y%m%d%H%M%S) &
    echolog 'done'
    #echolog $?
    # if [[ $? eq 0 ]]; then
    #   echolog 'done'
    # else
    #   exit 1
    #   echolog 'failed'
    # fi
}
stop() {
    ID=`ps -ef | grep "$mainClass" | grep -v "$0" | grep -v "grep" | awk '{print $2}'`
    for id in $ID
    do
        echolog 'killing process id='$id
        kill $id
        if wait_for 10 "not process_exists"; then
            echo ''
            echolog "kill pid=$id ok"
        else
            echolog "kill pid=$id fail"
            exit 1
        fi
    done

}
case "$1" in
start)
    stop
    start
    ;;

stop)
    stop
    ;;

restart)
    stop
    start
    ;;

*)
echo "Usage: $0 {start|stop|restart}"
exit 1
esac


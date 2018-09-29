#!/bin/sh

function remove()
{
    if [ $# -eq 0 ]; then
        rm
        exit 1
    fi


    local trash_dir=/tmp/trash/
    mkdir -p "${trash_dir}"

    local flag=0
    local avail_size=`df -k /tmp/ | grep -v Filesystem | awk -F" " '{print $4}' | tail -fn1`

    for argv in $@
    do
        if [[ ! -z "${argv}" && "${argv:0:1}" != "-" ]]; then
            if [ -e "${argv}" ]; then
                flag=1
                local argv_t=${trash_dir}/$(basename ${argv}).`date '+%Y%m%d%H%M%S%N'`

                # Get the size of the file to be removed
                local cur_size=`du -s ${argv} | awk -F" " '{print $1}'`

                # The margin of error is 1kb
                cur_size=$((cur_size + 1))

                # Make the trash bin directory empty first
                if [ ${cur_size} -gt ${avail_size} ]; then
                    /bin/rm -rf /tmp/trash/*
                fi

                mv "${argv}" "${argv_t}"
            else
                echo "No such file or directory '${argv}'"
            fi
        fi
    done

    [ ${flag} -eq 1 ] && echo "[NOTE] MOVE '$@' to trash bin '${trash_dir}', luckily, u can recover them by yourself!"

    return 0
}

remove $@

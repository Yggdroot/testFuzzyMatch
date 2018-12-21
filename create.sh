#!/bin/bash

if (( $# < 1 ))
then
    echo "Usage: $0 source.txt"
    exit 0
fi

cat $1 | while read line
do
    if [[ $line == */* ]]
    then
        dir=${line%/*}
        if [ ! -d "${dir}" ]
        then
            mkdir -p "${dir}"
        fi
    fi
    touch "$line"
done

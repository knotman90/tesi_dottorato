#!/bin/bash

#exit if some variables are not initialized
set -o nounset
#exit on error
set -o errexit

FILE=$1
COLOR=$2
SHADE1=$3
SHADE2=$4

i=0;
j=1
while IFS='' read -r line || [[ -n "$line" ]]; do
     if [ $((j%2)) -eq 0 ];
     	then
     	 j=$(($j+1))
     	 continue;
     fi

    if [ $((i%2)) -eq 0 ];
	then
	   echo "\rowcolor{gray!$SHADE1}"
	else
	    echo "\rowcolor{gray!$SHADE2}"
	fi
	echo "$line"
	i=$(($i+1))
	j=$(($j+1))
done < "$FILE"


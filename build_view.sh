#!/bin/bash

make
counter=`ps -aux | grep -c "evince"`;

killall evince
#if [ $counter -eq 1 ];
#then 
  nohup evince build/thesis.pdf&
#fi

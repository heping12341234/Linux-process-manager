#!/bin/bash

if [ $# -lt 1 ];then
	echo "please input thread num"
	exit
else
	
	alive=`ps aux|grep daemonrun|grep -v grep|wc -l`
	if [ $alive -lt $1 ]
	then
		((start_num=$1-$alive))
		i=0
		while [ $i -lt $start_num  ]
			do  
			setsid php /root/daemonrun.php > /dev/null &
			((i++))
		done
	fi
	
	if [ $alive -gt $1 ]
	then
		((stop_num=$alive-$1))
		i=0
		stopcomm=`ps aux  | grep daemonrun | grep -v grep | awk -F ' ' '{print $2}' `
		for file in $stopcomm;do
			if [ $i -lt $stop_num ]
			then
				kill -9 $file
				((i++))
			fi
		done
	fi
fi

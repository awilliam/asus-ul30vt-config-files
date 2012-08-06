#!/bin/sh

FILE="/tmp/.ul30vt.brightness"
ACTION=$(echo $@ | awk '{print $NF}')

case $ACTION in
	open)
		if [ -e $FILE ]; then
			VAL=$(cat $FILE)
			sleep 0.7
			/sbin/setpci -s 2.0 F4.B=$VAL
		fi
	;;
	close)
		/sbin/setpci -s 2.0 F4.B > $FILE
	;;
esac

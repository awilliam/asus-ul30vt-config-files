#!/bin/sh

FILE="/tmp/.ul30vt.brightness"
VAL=$(( 0x$(echo "$@" | awk '{print $3}' | colrm 1 7) ))

case $VAL in
	0)
		VAL="01"
	;;
	1)
		VAL="03"
	;;
	2)
		VAL="07"
	;;
	3)
		VAL="0b"
	;;
	4)
		VAL="0f"
	;;
	5)
		VAL="17"
	;;
	6)
		VAL="1f"
	;;
	7)
		VAL="27"
	;;
	8)
		VAL="2f"
	;;
	9)
		VAL="3f"
	;;
	10)
		VAL="4f"
	;;
	11)
		VAL="5f"
	;;
	12)
		VAL="6f"
	;;
	13)
		VAL="7f"
	;;
	14)
		VAL="8f"
	;;
	15)
		VAL="ff"
	;;
esac

/sbin/setpci -s 2.0 F4.B=$VAL
echo $VAL > $FILE

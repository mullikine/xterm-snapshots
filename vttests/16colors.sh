#!/bin/sh
# $XFree86$
#
# -- Thomas Dickey (1999/3/27)
# Show a simple 16-color test pattern.  It is a little more confusing than
# 8colors.sh, since everything is abbreviated to fit on an 80-column line.
# The high (8-15) combinations for foreground or background are marked with
# a '+' sign.

trap 'echo -n "[0m"; exit' 0 1 2 5 15
echo "[0m"
while true
do
    for AT in 0 1 4 7
    do
    	case $AT in
	0) attr="   ";;
	1) attr="BO ";;
	4) attr="UN ";;
	7) attr="RV ";;
	esac
	for FG in 0 1 2 3 4 5 6 7
	do
	    case $FG in
	    0) fcolor="BLK ";;
	    1) fcolor="RED ";;
	    2) fcolor="GRN ";;
	    3) fcolor="YEL ";;
	    4) fcolor="BLU ";;
	    5) fcolor="MAG ";;
	    6) fcolor="CYN ";;
	    7) fcolor="WHT ";;
	    esac
	    for HI in 3 9
	    do
	    	if test $HI = 3 ; then
		    color=" $fcolor"
		else
		    color="+$fcolor"
		fi
		echo -n "[0;${AT}m$attr"
		echo -n "[${HI}${FG}m$color"
		for BG in 1 2 3 4 5 6 7
		do
		    case $BG in
		    0) bcolor="BLK ";;
		    1) bcolor="RED ";;
		    2) bcolor="GRN ";;
		    3) bcolor="YEL ";;
		    4) bcolor="BLU ";;
		    5) bcolor="MAG ";;
		    6) bcolor="CYN ";;
		    7) bcolor="WHT ";;
		    esac
		    echo -n "[4${BG}m$bcolor"
		    echo -n "[10${BG}m+$bcolor"
		done
		echo "[0m"
	    done
	done
	sleep 1
    done
done

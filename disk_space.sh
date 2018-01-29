#!/bin/bash

MAX=95
EMAIL=mail@example.com

# df -T  --total --block-size=G | grep total will return values into array for usage.

my_array=( $(df -T  --total --block-size=G | grep total ) )

msg=("${my_array[5]} space is used.  Total Space is ${my_array[2]} out of which ${my_array[3]} is used and remaining is ${my_array[4]} ")

# convert an array value having percentage into integer and then doing comparison.

if [ ${my_array[5]%\%} -gt $MAX ]; then
	mail -s "Running out of disk space" $EMAIL <<< $msg
else
	mail -s "Disk Space Status" $EMAIL <<< $msg
fi

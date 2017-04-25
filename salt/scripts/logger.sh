#!/bin/bash

for filename in /var/log/*.log; do
	echo "`date`|$filename|`wc -l < $filename`" >> /root/counts.log
done

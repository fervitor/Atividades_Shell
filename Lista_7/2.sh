#!/bin/bash
while true ; do
	if [ -e key.txt ]; then
		break
	else
		sleep 2s
	fi
done

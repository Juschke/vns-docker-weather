#!/bin/bash
touch docker.log
log=docker.log
echo "Container Started..." > $log
echo "$(date +%FT%T) ping" >> $log


while true; do
	echo "$(date +%FT%T) ping" >> $log
	sleep 120
done

#!/usr/bin/env bash

while true; do
	response=$(curl https://api-cdn-cache.web.app/date -v 2>&1)
	hit_amount=$(echo "$response" | awk '/x-cache-hits/ { print $3 }')
	status_code=$(echo "$response" | awk '/^< HTTP\/2/ { print $3 }')
	cache_control=$(echo "$response" | grep 'cache-control')

	echo "---------------------------------"
	echo "Cache Hits: ${hit_amount}"
	echo "Status: ${status_code}"
	echo "Cache Control Header: ${cache_control}"

	sleep 2
done

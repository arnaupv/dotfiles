#!/bin/bash

harfile=$1
url_filters=$2

# Filtere URLs
filtered_urls="${harfile}.filtered_urls.dat"
jq .log.entries <"${harfile}" | jq '.[].request.url' | grep -v "${url_filters}" | uniq >"${filtered_urls}"

# URls sorted by num of occurences in the HAR file
sorted_urls="${harfile}.sorted_urls.dat"
uniq -c <"${filtered_urls}" | sort -k1 -nr >"${sorted_urls}"

#!/usr/bin/bash
#measere01.sh

URL=http://localhost/data/testdata/1G.dat
AVEDATA=avedata.dat

rm -f ${AVEDATA}

for request in $(seq 0 1000 10000)
do
	sum = 0
	for loop in $(seq 3000)
	do
		sum = $(echo "$sum + $(ab -c 100 -n {request} {URL} | grep 'Requests per second' | sed -r 's/.*( +)([0-9]+\.[0-9][0-9]) .*/\2/')" | bc)
	done

	ave = $(echo "$sum / 5" | bc)
	echo "${request} ${ave}" >> ${AVEDATA}
done
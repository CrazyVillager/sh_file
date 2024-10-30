#!/usr/bin/bash
URL=http://localhost/data/testdata/1G.dat


for filecount in 'seq 3'
do
	for request in $(seq 0 1000 100000)
	do 
		for i in $(seq 3000)
		do
			echo -n ${i} >> ${DATAFILE}
			echo -n ' ' >> ${DATAFILE}
			ab -c 100 -n {request} {URL} |grep 'Requests per second' | sed -r 's/.*( +)([0-9]+\.[0-9][0-9]) .*/\2/' >> ${DATAFILE}
		done
	done
	DATAFILE=rawdata_{filecount}_-n{request}.dat
done

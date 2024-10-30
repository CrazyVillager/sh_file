#! /usr/bin/bash

for filesize in 10M 20M 30M 40M 50M 100M 200M 300M 400M 500M 1G
do
    bash64 /dev/urandom | head -c ${filesize} > {filesize}.dat
done
#! /usr/bin/sh
#testplot.sh

gnuplot << EOF
set terminal png
set output "testplot.png"
set xlabel "Count of Attempts"
set ylabel "Request per Seconds"
set title "FreeBSD, Nginx 1.10.3, ab -c 100 -n 1000"
plot 'testdata01.dat' with line title "First", 'testdata02.dat' with line title "Second", 'testdata03.dat' with line title "Third"
exit
EOF

echo "plot succeeded"
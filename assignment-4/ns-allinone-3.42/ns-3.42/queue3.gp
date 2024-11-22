set term postscript eps color
set output 'queue3.eps'
set ylabel 'Queueing Delay (s)'
set xlabel 'Time (s)'
plot 'queueing_delay3.dat' using 1:2 with lines title 'Queueing Delay'
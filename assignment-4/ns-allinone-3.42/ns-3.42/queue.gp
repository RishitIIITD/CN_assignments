set term postscript eps color
set output 'queue2.eps'
set ylabel 'Queueing Delay (s)'
set xlabel 'Time (s)'
plot 'queueing_delay2.dat' using 1:2 with lines title 'Queueing Delay'
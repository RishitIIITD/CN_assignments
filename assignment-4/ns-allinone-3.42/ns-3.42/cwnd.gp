set term postscript eps color
set output 'cwnd2.eps'
set ylabel 'cwnd'
set xlabel 'time'
plot 'tcp-example2.cwnd' using 1:2
set term postscript eps color
set output 'cwnd3.eps'
set ylabel 'cwnd'
set xlabel 'time'
plot 'tcp-example3.cwnd' using 1:2
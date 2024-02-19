reset
set terminal pdfcairo enhanced color font "Helvetica,50" lw 2 size 10,7.8
set output 'chrome_bw_cpu.pdf'

set xlabel "Available Bandwidth (Mbps)" offset 0,1.2
set ylabel 'CPU Usage (%)' offset 3.3

set xrange [0:1020]
set yrange [0:105]
set xtics 0,200,1000 offset -0.3,0.5 scale 0.4
set ytics offset 0.4 scale 0.4

set key right bottom Left reverse at screen 0.93,0.19 samplen 1.2

set lmargin 5.4
set rmargin 1.3
set tmargin 0.2
set bmargin 1.8

set bars 1.2

set grid xtics ytics lw 1 lt 1 dt 2 lc rgb "gray70"
set grid mxtics lc rgb "gray70" lw 1
set mxtics 2

plot 'chrome_bw_cpu.txt' using 1:2 title columnheader(1)	w lp lw 4 lc rgb "blue" dt 1 ps 3 pt 7, \
					'' u 1:2:3 notitle w yerrorlines 		 lw 3 lc rgb "blue" dt 1 ps 3 pt 7, \
					'' u 1:4 title columnheader(2)		w lp lw 4 lc 2 dt 1 ps 3 pt 13, \
					'' u 1:4:5 notitle w yerrorlines 		 lw 3 lc 2 dt 1 ps 3 pt 13

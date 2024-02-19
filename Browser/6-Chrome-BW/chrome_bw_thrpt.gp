reset
set terminal pdfcairo enhanced color font "Helvetica,50" lw 2 size 10,7.8
set output 'chrome_bw_thrpt.pdf'

set xlabel "Available Bandwidth (Mbps)" offset 0,1.2
set ylabel 'Actual Throughput (Mbps)' offset 3.2

set xrange [0:1020]
set yrange [0:1020]
set xtics 0,200,1000 offset -0.3,0.5 scale 0.4
set ytics offset 0.4 scale 0.4

set key left top Left reverse at screen 0.18,0.95 samplen 1.2

set lmargin 6.3
set rmargin 1.4
set tmargin 0.2
set bmargin 1.8

set bars 1.2

set grid xtics ytics lw 1 lt 1 dt 2 lc rgb "gray70"
set grid mxtics lc rgb "gray70" lw 1
set mxtics 2

set arrow from 0,0 to 1020,1020 nohead lc rgb "gray60" lw 4 dt (9,9)
set arrow from 500,215 to 500,365 head filled size 25,28 lc rgb "red" lw 4

plot 'chrome_bw_thrpt.txt' using 1:2 title columnheader(1)	w lp lw 4 lc rgb "blue" dt 1 ps 3 pt 7, \
					'' u 1:2:3 notitle w yerrorlines 		 lw 3 lc rgb "blue" dt 1 ps 3 pt 7, \
					'' u 1:4 title columnheader(2)		w lp lw 4 lc 2 dt 1 ps 3 pt 13, \
					'' u 1:4:5 notitle w yerrorlines 		 lw 3 lc 2 dt 1 ps 3 pt 13

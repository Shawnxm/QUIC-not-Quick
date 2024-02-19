reset
set terminal pdfcairo enhanced color font "Helvetica,50" lw 2 size 12.5,7.8
set output 'chrome_size_thrpt.pdf'

set xlabel "File size (MB)" offset 0,1.2
set ylabel 'Throughput (Mbps)' offset 3.1

set xrange [0:1020]
set yrange [330:1000]
set xtics 0,200,1000 offset -0.3,0.5 scale 0.4
set ytics offset 0.4 scale 0.4

set key right center Left reverse at screen 0.9,0.57 samplen 1.2

set lmargin 6.4
set rmargin 1.4
set tmargin 0.3
set bmargin 1.8

set bars 1.2

set grid xtics ytics lw 1 lt 1 dt 2 lc rgb "gray70"
set grid mxtics lc rgb "gray70" lw 1
set mxtics 2

plot 'chrome_size_thrpt.txt' using 1:2 title columnheader(1)	w lp lw 4 lc rgb "blue" dt 1 ps 3 pt 7, \
					'' u 1:2:3 notitle w yerrorlines 		 lw 3 lc rgb "blue" dt 1 ps 3 pt 7, \
	   				'' u 1:4 title columnheader(2)		w lp lw 4 lc 2 dt 1 ps 3 pt 13, \
	   				'' u 1:4:5 notitle w yerrorlines 		 lw 3 lc 2 dt 1 ps 3 pt 13

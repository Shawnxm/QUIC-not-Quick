reset
set terminal pdfcairo enhanced color font "Helvetica,42" lw 2 size 10.1,5
set output 'chrome_cpu_thrpt.pdf'

set xlabel "CPU Frequency (GHz)" offset 0,1.4 font "Helvetica,42"
set ylabel 'Throughput (Mbps)' offset 3.2 font "Helvetica,42"

set xrange [0.5:5]
set yrange [0:1000]
set xtics 0,1,5 offset -0.2,0.6 scale 0.5
set ytics 0,200,1000 offset 0.4 scale 0.5

set key center top Left reverse at screen 0.67,0.82 font "Helvetica,36" samplen 0.5 width 0 maxrows 2

set lmargin 6.2
set rmargin 1.1
set tmargin 0.4
set bmargin 1.6

set bars 1.5

set grid xtics ytics lw 1 lt 1 dt 2 lc rgb "gray70"
set grid mxtics lc rgb "gray" lw 1
set mxtics 2

plot 'chrome_cpu_thrpt.txt' using 1:2 title columnheader(1)	w lp lw 4 lc rgb "blue"			dt 1 ps 3 pt 7, \
					'' u 1:2:3 notitle w yerrorlines			 lw 3 lc rgb "blue"			dt 1 ps 3 pt 7, \
					'' u 1:4 title columnheader(2)			w lp lw 4 lc rgb "dark-green"	dt 1 ps 3 pt 13, \
					'' u 1:4:5 notitle w yerrorlines			 lw 3 lc rgb "dark-green"	dt 1 ps 3 pt 13, \
					'' u 1:6 title columnheader(3)			w lp lw 4 lc rgb "skyblue"		dt 2 ps 3 pt 6, \
					'' u 1:6:7 notitle w yerrorlines			 lw 3 lc rgb "skyblue"		dt 2 ps 3 pt 6, \
					'' u 1:8 title columnheader(4)			w lp lw 4 lc rgb "sea-green"	dt 2 ps 3 pt 12, \
					'' u 1:8:9 notitle w yerrorlines			 lw 3 lc rgb "sea-green"	dt 2 ps 3 pt 12
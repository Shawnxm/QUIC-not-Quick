reset
set terminal pdfcairo enhanced color font "Helvetica,42" lw 2 size 9.3,5
set output "browser_thrpt.pdf"

set ylabel "Throughput (Mbps)" offset 3.2 font "Helvetica,42"

set yrange [0:1000]
set xtics font "Helvetica,42" offset 1.3,0.52 nomirror
set ytics 0,200 font "Helvetica,42" offset 0.45 scale 0.4

set key center top Left reverse at screen 0.55,0.997 width 2.5 samplen 4.0 maxrows 1

set lmargin 6.3
set rmargin 0.4
set tmargin 1.0
set bmargin 1.0

set grid ytics lw 1 lt 1 dt 2 lc rgb "gray50"

set boxwidth 0.93
set style data histograms
set style histogram errorbars lw 2
set offset -0.59,-0.35,0,0

plot 'browser_thrpt.txt' using 2:3:xtic(1) title columnheader(2) lc rgb "forest-green" lw 2 fs pattern 7 axes x1y1,\
				'' using 4:5:xtic(1) t columnheader(3) lc rgb "orange" lw 2 fs pattern 2 axes x1y1

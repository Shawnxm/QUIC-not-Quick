reset
set terminal pdfcairo enhanced color font "Helvetica,40" lw 2 size 12,3.6
set output "parallel.pdf"

set ylabel "Download Time (s)" offset 3.0 font "Helvetica,40"

set yrange [0:14.2]
set xtics font "Helvetica,40" offset 0.8,0.4 nomirror
set ytics 0,3 font "Helvetica,40" offset 0.5 scale 0.4

set key center top Left reverse at screen 0.51,0.995 font "Helvetica,40" width 0.5 samplen 1.5 maxrows 1

set lmargin 4.5
set rmargin 0.5
set tmargin 1.05
set bmargin 1.1

set grid ytics lw 1 lt 1 dt 2 lc rgb "gray70"

set boxwidth 0.93
set style data histograms
set style histogram errorbars lw 2
set offset -0.55,-0.35,0,0

plot 'parallel-time.txt' using 2:3:xtic(1) title columnheader(2) lc rgb "navy" lw 3 fs pattern 1 axes x1y1,\
				'' using 4:5:xtic(1) t columnheader(3) lc rgb "dark-blue" lw 3 fs pattern 2 axes x1y1, \
				'' using 6:7:xtic(1) t columnheader(4) lc rgb "medium-blue" lw 3 fs pattern 4 axes x1y1, \
				'' using 8:9:xtic(1) t columnheader(5) lc rgb "blue" lw 3 fs pattern 7 axes x1y1

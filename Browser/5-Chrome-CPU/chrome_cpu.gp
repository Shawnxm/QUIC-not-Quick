reset
set terminal pdfcairo enhanced color font "Helvetica,50" lw 2 size 7.5,7.8
set output 'chrome_cpu.pdf'

set ylabel 'CPU Usage (%)' offset 3.3
set xrange [0.4:2.6]
set xtics 0,200,1000 offset 0,0.5 scale 0.5
set ytics offset 0.5 scale 0.5

set lmargin 5.1
set rmargin 0.4
set tmargin 0.4
set bmargin 2.0

set grid lw 1 lt 1 dt 2 lc rgb "gray70"

set boxwidth 0.4
set style fill solid 1 border -1
# set style data boxplot
# set style boxplot fraction 0.95
# set style boxplot nooutliers

plot 'chrome_cpu.txt' using ($2):($5):($4):($8):($7):xtic(1) with candlesticks lc rgb "purple" lw 2 ti col axes x1y1 whiskerbars, \
			'' using ($2):($6):($6):($6):($6) with candlesticks lw 2 lt 1 lc rgb "black" notitle axes x1y1

reset
set terminal pdfcairo enhanced color font "Helvetica,40" lw 2 size 16,4.8
set output "web_time.pdf"
set multiplot layout 1,2

set ylabel "CDF" offset 3.25 font "Helvetica,40"

set yrange [0:1]
set ytics offset 0.4,0.1 scale 0.5

set key left top Left reverse samplen 1.8

set lmargin 5.2
set rmargin 1.1
set tmargin 0.4
set bmargin 1.8

set style line 12 lc rgb 'black' lt 12 lw 1
set grid xtics ytics lc rgb "gray" lw 5

set xrange [0:2]
set xtics 0.2 offset -0.3,0.45 scale 0.5
set xlabel "Page Load Tests over Ethernet" offset 0,1.2 font "Helvetica,40"
plot 'eth_dt.csv' u 1:(1./100.) w p title 'CDT' smooth cumulative lc rgb "forest-green" lw 4, \
	'eth_plt.csv' u 1:(1./100.) w p title 'PLT' smooth cumulative lc rgb "orange" lw 4, \
	'eth_ttfb.csv' u 1:(1./100.) w p title 'TTFB' smooth cumulative lc rgb "blue" lw 4


set xrange [0:2]
set xtics 0.2 offset -0.3,0.45 scale 0.5
set xlabel "Page Load Tests at 100 Mbps" offset 0,1.2 font "Helvetica,40"
plot '100m_dt.csv' u 1:(1./100.) w p title 'CDT' smooth cumulative lc rgb "forest-green" lw 4, \
	'100m_plt.csv' u 1:(1./100.) w p title 'PLT' smooth cumulative lc rgb "orange" lw 4, \
	'100m_ttfb.csv' u 1:(1./100.) w p title 'TTFB' smooth cumulative lc rgb "blue" lw 4
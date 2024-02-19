reset
set terminal pdfcairo enhanced color font "Helvetica,38" lw 2 size 10,4.8
set output "web_stats.pdf"
set multiplot layout 1,2

set ylabel "CDF" offset 3.45 font "Helvetica,38"

set yrange [0:1]
set ytics 0.2 offset 0.5,0 scale 0.5

set lmargin 5.0
set rmargin 1.2
set tmargin 0.4
set bmargin 1.8

set grid xtics ytics lc rgb "gray70" lw 1 lt 1 dt 2

set xrange [0:1000]
set xtics 200 offset -0.3,0.45 scale 0.5
set xlabel "Number of Objects" offset 0.1,1.2 font "Helvetica,38"
plot 'web_obj_num.csv' u 1:(.01/1.00) w p notitle smooth cumulative lc rgb "blue" lw 4

set xrange [0:30]
set xtics 10 offset -0.3,0.45 scale 0.5
set xlabel "Page Size (MB)" offset 0.1,1.2 font "Helvetica,38"
plot 'web_page_size.csv' u 1:(.01/1.00) w p notitle smooth cumulative lc rgb "blue" lw 4
